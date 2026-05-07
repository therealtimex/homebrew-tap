cask "realtimex@1.0.185-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.185-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9e7a31b063f82ca3e87d27991a94146a4d758d306d5b0b932dfad0503fff0424",
         intel: "c63725e4908be7e040dd4ec68e33e6078473092539ba2ce2b85e2a1ebe2bad5d"

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
