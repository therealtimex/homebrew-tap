cask "realtimex@1.1.125-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.125-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0418c313cd7030a5890687d3d20aa6a064e53054e5f8d858c057a35969c40381",
         intel: "42ce61c69fb8b6c8a1a8481510e08e8b59b12affb5ae7570427cdb40a8ddc497"

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
