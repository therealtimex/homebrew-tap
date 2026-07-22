cask "realtimex@1.1.331-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.331-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "bf4926d0f883b64268f2bbf398d918ee9df302397cdd452bf5b39cbe87d45bcc",
         intel: "93efa1004cb050a727b9fadc0493870bf3ae9beb796398927f5b3756edc5a1da"

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
