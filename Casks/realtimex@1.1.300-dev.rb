cask "realtimex@1.1.300-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.300-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2665fa50b903a04a222a66cea8397dd196de904858c3302942f634b5a137e064",
         intel: "6ec7f4df0557184f637ea4807c3e8d5781b8e350f4bdfd9dd517627f8f23952e"

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
