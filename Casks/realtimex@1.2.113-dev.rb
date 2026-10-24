cask "realtimex@1.2.113-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.113-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ce5d7faa287a09ef194fdc0f3005cde475764626baddfd4e1667e515b03cc94a",
         intel: "a93ab913b8fb10f3992dbe1d9b3b828f79ca7d12ed5e4ab4868842f523c2a806"

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
