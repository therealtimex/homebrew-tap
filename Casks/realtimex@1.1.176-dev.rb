cask "realtimex@1.1.176-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.176-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "244352784e53f9c3e4700aa4e0ee6eee63f17c6dbc603dbd06638fe6b5c0de8b",
         intel: "d399bae5e9bdbff9c4f2a3f8925bd3945f8f33ed626aba5250a376bce383ae5d"

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
