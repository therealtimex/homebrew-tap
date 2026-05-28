cask "realtimex@1.0.247-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.247-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ff64cbef3ec5a3d66a08df0fd1359af25e8a462a429510fd798ef7ef198b7bb2",
         intel: "e6e322d73bfdf92456c6bf0c53aa8c15a7afb180fbb51c0c788ff565f39715dd"

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
