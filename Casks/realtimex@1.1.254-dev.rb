cask "realtimex@1.1.254-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.254-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8a13e605dfadc43370b8db0d2974d5fdee1dde66a292407e2ac6b993eac872ad",
         intel: "0b76b7c9c077fb83728286c2ddf0b6952b8c285fd0cce18e6f9f763294b1e842"

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
