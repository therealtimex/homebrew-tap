cask "realtimex@1.1.195-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.195-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c171f6cbc167214df30102503e5c7236023466fcd830312cc31249d8e5cdde7b",
         intel: "cb87872597e2fc4fe9177f5643a09836234b28b0bea0a486dad730e912bc7089"

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
