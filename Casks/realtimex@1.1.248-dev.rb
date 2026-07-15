cask "realtimex@1.1.248-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.248-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2698e8c613157779979a90aafcec84e2d33800b380acafe8f563532a655c0ee3",
         intel: "71946b0e86bdc082b96eb6db93798cf4e66dcef7e3e46e570644c601586e9987"

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
