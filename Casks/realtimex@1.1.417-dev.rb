cask "realtimex@1.1.417-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.417-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f8a2d49a4d864f3893222bfb2fa1e6b67fc707e0c679a38aba846cfaceb2f54b",
         intel: "82071e754e88975f1f7d22c5deead1b2a6a41dc81eb31d46338c94f10bdff5ce"

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
