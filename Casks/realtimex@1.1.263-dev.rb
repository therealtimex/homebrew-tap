cask "realtimex@1.1.263-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.263-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5b27c789b58fd11124be4dc8351c9839d65fac3ad12d29b3b7b54ca7a1f09907",
         intel: "1bc288f5290ae766092614fd4df084d6d058c5254a43425ae75377666be2c14b"

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
