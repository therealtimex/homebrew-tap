cask "realtimex@1.1.67-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.67-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5fb8bb521231ad8b3eb24ba48e0340369785b04daf44e990a93f34e646b9cf70",
         intel: "2e427ecd953d5d054fd2e857cb9314f7b5f5d50d166a88524177cf774ecafd7d"

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
