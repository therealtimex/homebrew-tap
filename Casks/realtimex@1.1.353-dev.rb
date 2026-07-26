cask "realtimex@1.1.353-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.353-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0b7ae6c617080d2f745b040af0488914a74c3ace961e7b97ea6aff039f5d0b82",
         intel: "62363532f67033f852f518aa9a0760ed058f9fe4a00a8502c8a3f48d8563977f"

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
