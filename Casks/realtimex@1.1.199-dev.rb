cask "realtimex@1.1.199-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.199-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c07c22a597e5bb78d96c2315d74d5ba732a192ce289908be9f03e4c742d3b407",
         intel: "922724adabacdbea3ad32345dc62d6707ebabe36a82cff6d7f7b36e18dd8b584"

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
