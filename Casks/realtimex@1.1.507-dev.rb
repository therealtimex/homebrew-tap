cask "realtimex@1.1.507-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.507-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f6035ee982218c1ff36ad0d6c5183190366756a791a70eeab0b8474dec2c66cb",
         intel: "5cc684d987a813f9ca2d420f92e8776e525480cb2db2592773b07b7042e9bc71"

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
