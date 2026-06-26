cask "realtimex@1.1.140-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.140-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e3dff5dc65a1c6ae76a88c3537c4085730e744d1603501529bf473a0b76e25c5",
         intel: "d01f8e8b47e9e4c61038fe701cd05c6aa3dc1f48d439cdaeb449324a6ce66b92"

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
