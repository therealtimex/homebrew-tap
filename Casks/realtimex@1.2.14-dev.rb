cask "realtimex@1.2.14-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.14-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e03c80d8bc26187fd3c007f4d3daa6630b3fe16b6682f65a40107a2d9006b402",
         intel: "19685796606ef896a76798ecae14b7772c681ccf99b00f7a06b388c237615158"

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
