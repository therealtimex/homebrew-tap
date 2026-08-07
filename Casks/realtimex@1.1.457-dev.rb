cask "realtimex@1.1.457-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.457-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "18940539dba56c71debfa17b32bedc29b8179f0bdecdbef43c6df2eb9a35e9ad",
         intel: "d4f8abc4a097c222febe4083946ca844a1ab5edf1b2282bf9a0043e8d62eb908"

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
