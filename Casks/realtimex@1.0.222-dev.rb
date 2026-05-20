cask "realtimex@1.0.222-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.222-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a7ab0269f09186732e9366cb119984271c01ea022875b9544188519d4eb3dda3",
         intel: "1ca1968060f9d081edfa3f9ec53878f66656012a8524e7cfdb4b06a0157a3472"

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
