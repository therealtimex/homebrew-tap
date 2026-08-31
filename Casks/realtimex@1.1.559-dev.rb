cask "realtimex@1.1.559-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.559-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a64dc2835dfd2af10482d363546ae8535c9a46d0312c1b596feb393e31ce5939",
         intel: "5d5830dcb8242e803aae75ed09135a4477e0373a6f2579d869b3c5a95c1b34b4"

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
