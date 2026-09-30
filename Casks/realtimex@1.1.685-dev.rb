cask "realtimex@1.1.685-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.685-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "04b6364d6f734c8b9bd3388473ff3f29b6d902658b899cab3bf3440dd72caeac",
         intel: "41d2e2fed04cac01d22a9f819b1354aa67139d7a463f98a75197cc931dfe5346"

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
