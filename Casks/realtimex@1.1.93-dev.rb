cask "realtimex@1.1.93-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.93-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f1a741d4653942548f59f0aef254404eb011de4aa4b2fe2bcdd71adae6f0eeb2",
         intel: "0baeedc23df17207c930df826e9ad912fd6f22640d8a8a4b130b3c9e4dae9301"

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
