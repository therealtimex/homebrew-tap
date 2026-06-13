cask "realtimex@1.1.87-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.87-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6b93352dba926e5cc694e4bfd24ced95849adcb044310cb49a759d66666baaa0",
         intel: "46a5ac0925b3693f7db232d16fec8eba22d229a5def59c4fb3337827e6d3cde6"

  # Use the #{arch} variable in your URL
  url "https://github.com/therealtimex/realtimex/releases/download/v#{version}/RealTimeX.AI-#{version}#{arch}.dmg"

  name "RealTimeX"
  desc "Find powerful AI Agents for RealTimeX"
  homepage "https://realtimex.ai/"

  app "RealTimeX.AI.app"

  preflight do
    system_command "/usr/bin/osascript",
                   args: ["-e", 'tell application "RealTimeX.AI" to quit']
  end

  caveats <<~EOS
    RealTimeX.AI will be placed in Applications.
  EOS
end
