cask "realtimex@1.1.161-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.161-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e242c19602d761328bc1a144a0bccad71e7c8c399ef2150deb1457532dd99029",
         intel: "a33d59635ce2d90b89c0046c7f44eb8ff0bf63de342129778fdfb57d712267ea"

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
