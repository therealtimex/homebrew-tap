cask "realtimex@1.1.41-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.41-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4d1e77c3a98ac0f0f0a9e005c65e9450f839a60b4b72768a6d55ee1216512c55",
         intel: "c72b641e8a060a9da5c0c27e4653b5d3bff3159fcc259c88e310aed7a80d33a4"

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
