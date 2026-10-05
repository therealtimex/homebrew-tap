cask "realtimex@1.1.700-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.700-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8057f8eb74b0e988040da7d2f34a01ca9609f1e70f3239f8a35a03f0fa4e0a7a",
         intel: "4a4b9cf29a59ffc5b51afa01cabf511f56e44756229ea3e152bc238a74b08ab4"

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
