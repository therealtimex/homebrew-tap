cask "realtimex@1.1.81" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.81"

  # Provide both SHA256 hashes
  sha256 arm:   "46102ac59ff519e2db202d9ccfc5b05c2ad29b1044ceb7451b81ef8ab80844c1",
         intel: "cf2977c82e53a9386f25e5c53d2a075b94357e88db914586aa87c96506f610b4"

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
