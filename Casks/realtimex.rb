cask "realtimex" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.121"

  # Provide both SHA256 hashes
  sha256 arm:   "6a8fe8731a45191207c3b073f1e6f5207996523b17eff488e9fcfc2c8ba5d46d",
         intel: "05f92be51b2cabca94f73614e032c20037ec1762c67c16eb949a06cbee785687"

  # Use the #{arch} variable in your URL
  url "https://github.com/therealtimex/realtimex/releases/download/v#{version}/RealTimeX.AI-#{version}#{arch}.dmg"

  name "RealTimeX"
  desc "Find powerful AI Agents for RealTimeX"
  homepage "https://realtimex.ai/"

  depends_on formula: "redis"
  app "RealTimeX.AI.app"

  preflight do
    system_command "/usr/bin/osascript",
                   args: ["-e", 'tell application "RealTimeX.AI" to quit']
    sleep 2
  end

  caveats <<~EOS
    RealTimeX.AI will be placed in Applications.
  EOS
end
