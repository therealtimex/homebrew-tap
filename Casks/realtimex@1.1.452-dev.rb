cask "realtimex@1.1.452-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.452-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "cfcd60a43398c49efcc6cbbce45cc0faf5058d7f862ef4175d0b899448f52dc3",
         intel: "bc9bd7271eaac63bb51aa742e59fa18f55dc897d1b93849e46cba75d85bfa5c5"

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
