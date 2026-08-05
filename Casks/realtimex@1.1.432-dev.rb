cask "realtimex@1.1.432-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.432-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f2b40434d39a893c79d066dbd8f9beec1a483f3e829876e1286cfdade76e12f4",
         intel: "79ddae61f45d4b3ec35d99173d98a9141a54143cfd0efae09b04cf97b9e7daa2"

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
