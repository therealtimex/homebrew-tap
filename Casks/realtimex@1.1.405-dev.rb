cask "realtimex@1.1.405-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.405-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "02a604b6dd3f3574aa01d9b2bfbbcb08f7e5898367d7987d3c2d98e71b060e53",
         intel: "8fab909eb01c0ca810f634d484e3a71b2aa5e5ec8dae0ef6d18f45ed5a3cebc9"

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
