cask "realtimex@1.0.160-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.160-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5ffa3e00b14c844639871e43a2333031bed6f0f791431f3245d5bcb2dda8b69f",
         intel: "8e39da9e7621bd35e61e76983fc2f5343cd97a6939986e2de606d5ce6247c3bf"

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
