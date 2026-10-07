cask "realtimex@1.1.706-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.706-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "cd8e378c05ed3592b153f403bb8bfedeaa8606667bc6940dda8b0411d76fe7db",
         intel: "68df1416ae30a494da8c30db78c3db6ce4d736cef510c28ad8781e25bfe26d0f"

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
