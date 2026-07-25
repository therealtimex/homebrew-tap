cask "realtimex@1.1.351-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.351-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "bc0d53a40bb462cf998849370168ddf2be2aec7c5e9b6131ba0bad993d22f44b",
         intel: "ffddfcc5d01e2f2a0cb4b623cb609192467e042b0f5ecab0643825369a94a4bb"

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
