cask "realtimex@1.1.668-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.668-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ea91ac05ab66cb796f352a3c61bd7d75c2b219859a8b2b3c7b847aff44be9868",
         intel: "04a9d5944e5b585e6dc2881141e9949b2c0431cf766ac4ae333ac49fca33d0d3"

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
