cask "realtimex@1.1.227-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.227-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4dea3f22996b2d06197a25507f42cabf91adff493cf794ee0e9f3f4160205bb2",
         intel: "736137b5ed87395e5b1d328629929d12ad98c2b06195de08eaeb2be7e22e9a3a"

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
