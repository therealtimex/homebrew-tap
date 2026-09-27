cask "realtimex@1.1.667-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.667-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9232b5dc5fad0ac9effe0330ef090c99470b5748426b1275d23cf779e874b703",
         intel: "33f88d2cea5621007b8229940b8a08af6cc96eac7173fe86e49feac4e68c382a"

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
