cask "realtimex@1.0.181-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.181-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0bb2106680dd3d1242098940a1e63a3ae36f4e91372a0cca4972d0342965e026",
         intel: "11c02060ecad3e39971acec681b327c56220b368a9de5d7bf582b23e201a7ec8"

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
