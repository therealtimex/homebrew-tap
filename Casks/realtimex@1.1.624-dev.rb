cask "realtimex@1.1.624-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.624-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "43309fc1284910513cc87d4056db3081202a2c8b7a311f7af05d7fc4ff8f65bd",
         intel: "e3a5f7d5dd60b635dce67aed1b1d917e73b47ae3a8275c4d2a97fd00b220fb6e"

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
