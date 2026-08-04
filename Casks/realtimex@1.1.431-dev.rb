cask "realtimex@1.1.431-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.431-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1b8e2ec7ce17c52cf50bc74dab8f4b046230b1c93409cd01455f88f803139479",
         intel: "199bb2e7366344c1cd771cfe10e6246977df48aaa77eb59313531025feb35a01"

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
