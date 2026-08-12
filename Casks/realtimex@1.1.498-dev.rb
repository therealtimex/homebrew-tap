cask "realtimex@1.1.498-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.498-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "dd0fb1438d7ad1602cc401d9e484cf04a8619487b3f88247f533913eff9428ee",
         intel: "31e6d60692dd2b4a148fd1b1c28f5cffa9775dff7e3fcb6c87bbee81ebdd59e5"

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
