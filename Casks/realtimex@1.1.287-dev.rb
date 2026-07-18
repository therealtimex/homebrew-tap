cask "realtimex@1.1.287-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.287-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "31d737d5127e0a102f2e43275cd21db6a1aedfbd7e5a2e95102a9d7ccb85acaa",
         intel: "9ec40d938b5a711b943077e3ce15ea24d6b5484f1dd2d6ddb76fd96143a90ad6"

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
