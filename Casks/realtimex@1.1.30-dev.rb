cask "realtimex@1.1.30-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.30-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9f74022ae0018777f60a040b4fab4019c646709a586bfaafe3aaa7a9740e5f6f",
         intel: "bf73565f57f040d5da33ed34bc7268a40736053783e6bea76923675af9365ef7"

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
