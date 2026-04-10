cask "realtimex@1.0.119-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.119-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0d6575527c2db1db30b44e7ca2af3ba9d1ee5f88b1a5ade9ab2c4866f121ddd6",
         intel: "f023ac0f759d4c099b594b8fd2e88f11b16b6e69e453a03dfc751c167f6250a0"

  # Use the #{arch} variable in your URL
  url "https://github.com/therealtimex/realtimex/releases/download/v#{version}/RealTimeX.AI-#{version}#{arch}.dmg"

  name "RealTimeX"
  desc "Find powerful AI Agents for RealTimeX"
  homepage "https://realtimex.ai/"

  depends_on formula: "redis"
  app "RealTimeX.AI.app"

  preflight do
    system_command "/usr/bin/osascript",
                   args: ["-e", 'tell application "RealTimeX.AI" to quit'],
    sleep 2
  end

  caveats <<~EOS
    RealTimeX.AI will be placed in Applications.
  EOS
end
