cask "realtimex@1.1.44-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.44-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0eff55b82c6655acf2ac86090c8ec546f7df95679291320746973c760c9690d0",
         intel: "9654985341ffb613423dc252a85247d21ab5f1a979c50c5c3b713bc167a3f877"

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
