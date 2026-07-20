cask "realtimex@1.1.314-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.314-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3ea9347f0865b30ab676fd8e2c280e5b6ba08f0a6762c8a690a3aa93d45ebbcc",
         intel: "93f5320f7893efb1e07371c5900a7400a5b5ad3917da2d10fb476864dd7964d2"

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
