cask "realtimex@1.0.125-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.125-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "45bc6c59fd723a211b33df9a7c36e056155094954f5cb562c31eddb5f62f45e8",
         intel: "a9b4fc47fb074acfe0c0f91adae57ca69682d26304f1a1117b22dc31f3fb9808"

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
