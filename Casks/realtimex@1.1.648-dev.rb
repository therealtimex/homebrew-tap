cask "realtimex@1.1.648-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.648-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "157ddd270c8d07122a377f5718f1393126902d4916d0c67e07760be304db8ee2",
         intel: "9a21965890e819d756494d141b1bdd9cd16bfa2ad25144dd0ab50c669f156f17"

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
