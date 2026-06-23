cask "realtimex@1.1.128-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.128-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0cbd530fa1b23f4245d11915bbcf4ef7f688b0041be97d2dd9e21a49d429b07b",
         intel: "eef9b21df1a5e4cb5031671ec54331e12984e01c56fd2bb3362f9f2577b8865d"

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
