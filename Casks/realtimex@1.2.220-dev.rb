cask "realtimex@1.2.220-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.220-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7b8e551f462d865b3fd803ca2de4f01b6a9a1ca9aef10f91874f97fb62612b3f",
         intel: "6c76020dc6b0569b45133650fcb5115ebb483cd075023c0d7f1e8578ba0ca836"

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
