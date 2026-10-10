cask "realtimex@1.2.9-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.9-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "92fa56377d2368da936aa7adb24f6aee8d56cf39888350c78f222d719e1cfe17",
         intel: "eb6e148993232cf8c009be297f5892aa6ff082ac02840a0559fd6c6b20cebc49"

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
