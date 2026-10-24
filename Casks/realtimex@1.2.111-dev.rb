cask "realtimex@1.2.111-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.111-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e59f60ebc2814a082dcc0cf66f5d6cf7bdf02dc2873850623edf69b264f6abec",
         intel: "0633d11bb885f3d6fbcefc35d0c7d0515732449bb1b939c0f4fb8f5da9dd9838"

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
