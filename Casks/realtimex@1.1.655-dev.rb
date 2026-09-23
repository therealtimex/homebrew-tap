cask "realtimex@1.1.655-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.655-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d58f88f2d2c10a5df5ee8df818ead93ab3e3b3a9d21f114e7b9b327d869360a0",
         intel: "bd6b74028fc40491f02aa412c2de4c16fd7f7362508ea1e677b1b50535162aad"

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
