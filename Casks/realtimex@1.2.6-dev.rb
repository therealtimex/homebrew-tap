cask "realtimex@1.2.6-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.6-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e282aa1ba2e66669215291796f764440092da269420d20c587c7a8b0c45da06b",
         intel: "9ce38bb49d2b487abb8be6cbe84e27c8f441982f2a4be3a9295f1ee5c5652678"

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
