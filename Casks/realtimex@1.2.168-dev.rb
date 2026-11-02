cask "realtimex@1.2.168-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.168-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4e1d9495b35e72035768b41a09556a172d472d6811bc247b4ded185b756116b4",
         intel: "d32fd5cfa3031a33668158fd26db5a1684a9f0c4b097ab55f0434e3e1f9c2e1f"

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
