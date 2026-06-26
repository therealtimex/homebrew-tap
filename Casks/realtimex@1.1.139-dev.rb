cask "realtimex@1.1.139-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.139-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "83898c2a91b9da58f37d8ade45cfcd00bd362a223cc4fef2791802d77a82874b",
         intel: "7160f24e60f7d46adb4846b5260fe96ecfb6b5f0c863ad592dfc1c6b2a82f4d4"

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
