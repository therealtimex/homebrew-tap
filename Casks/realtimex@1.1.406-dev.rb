cask "realtimex@1.1.406-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.406-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1d2d37601926a8ea9ed1b14d1ef4a8568cb432cf2cb6e7eb12dfc743410fbecf",
         intel: "41a92e0ebe23ed941576f372ec8df761c561a8e3afba054f9d3dcabf699c0e15"

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
