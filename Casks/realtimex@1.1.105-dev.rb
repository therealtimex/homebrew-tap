cask "realtimex@1.1.105-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.105-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e57a7b33ff77cfdcfbe7a3d060e3125afc5378daf40387018d320aef4f791a41",
         intel: "3451e62a13025d60e36bd4995d8906defe47c435b596da67b14aa41a5411fe11"

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
