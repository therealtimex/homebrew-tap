cask "realtimex@1.1.57-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.57-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c6a8eaeb127d54e63bf8e56b655d073e5a6970075aafc53a857d9c1385dceb6d",
         intel: "bb96db19c58b46ef1bd276bad27efcf34a06d91b6dd3365afec6c6f0e229e9b0"

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
