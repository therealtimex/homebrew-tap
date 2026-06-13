cask "realtimex@1.1.84-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.84-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "cff410a4c3832e8be9b7fd54897c28617fcd1e5ec88e4163b686545f9d3c95ea",
         intel: "5fa3876cb59165600232b792d46b3f46de44c5dc57c5da0611159ad59cc81858"

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
