cask "realtimex@1.1.264-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.264-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "17d224e42ecbc4ba548fd1b29d5b4c33161caecf6ee155e193b892b838d33277",
         intel: "9c4afaa8f44516e77affeedf590c1096d3cee91a2c7ff93c48398a3bd3e2cee2"

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
