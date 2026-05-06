cask "realtimex@1.0.182-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.182-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3a069752f2706d4dc266ed47d3c3f1359c43dcd2a0833e666b8069e8fb1f1a2f",
         intel: "3c7b8b9a7d9e66b3292cca2dd11e4858f818836ab3ee130a99b7cd99d7abc9b6"

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
