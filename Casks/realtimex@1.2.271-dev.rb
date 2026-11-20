cask "realtimex@1.2.271-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.271-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "914dfc2c9e3e51f47b695d80dff44713c45f1bd178e72900573c8d858db4ee15",
         intel: "c036db649d4d7d573059d9f7f890d46a29fb4f192c80d81feae8bb8e5ec065da"

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
