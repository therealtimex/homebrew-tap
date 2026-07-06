cask "realtimex@1.1.190-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.190-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7705931cc2b7108f44b31ad2d6093934d0eb725a56b2bb309e075c99f6bd47b8",
         intel: "dc24b77a43d05bf81cfc56c0c7cc7217ee8debc74589ea97da69e8dc91c3859e"

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
