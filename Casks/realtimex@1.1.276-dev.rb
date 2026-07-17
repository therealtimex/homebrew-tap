cask "realtimex@1.1.276-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.276-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e0a146ee318ba9956280827853a51c3336af360bd1737a594bdfbab52c124f03",
         intel: "c6c2d69a9cc582e06dc712d4b5e98373cdf6b4a3a7c07c60ffbc92dc8831f238"

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
