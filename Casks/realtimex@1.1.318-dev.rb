cask "realtimex@1.1.318-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.318-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "876f460816039e4dab7a86603815987b888696d596a39226660ed92ca3bfda63",
         intel: "882f61a326fdb25c162ffc8b51dff51f537517caf993e6e6cad2d4203a3624fb"

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
