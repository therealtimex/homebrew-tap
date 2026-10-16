cask "realtimex@1.2.49-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.49-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "17e84e99940570d809cf27355a04e0aea78eca681c4d4c078276f0e922131740",
         intel: "d7966bec79f2481e630d18b777dc1bf8022c99158bf90c6352896daa7798b09b"

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
