cask "realtimex@1.0.113-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.113-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "73f1757d9c8cebac6c999fb2a9b6224c4480c0d694714884b3e200e654b346d0",
         intel: "06f86e322af9c3db793045e5f03c28b1d7624280a4e0dbc80e28b960f540af07"

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
