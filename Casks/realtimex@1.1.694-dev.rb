cask "realtimex@1.1.694-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.694-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "cc8f3afbc9b1b63876ce783cf06811bedd7f3ef8be4b5e42c3a5bfa3bb2e6be5",
         intel: "6601a86868bb579774a7020fbecd435a6c9328514bd4a7e281505ef6bfb82997"

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
