cask "realtimex@1.0.139-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.139-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7080fd98076062871d474823ed56c2ef52b6f0979f6d116537aab2673aef7ffe",
         intel: "5d3bf691db66ef7d641cb7da564427c766e5fee3f35dcad63d167c8845e5b9f1"

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
