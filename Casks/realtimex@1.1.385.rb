cask "realtimex@1.1.385" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.385"

  # Provide both SHA256 hashes
  sha256 arm:   "bdfcab22abf7bb5d2b12f0525f48a916c987256d74d5ae3f68e63b68d00ccca1",
         intel: "2876fe13e8fc7f1e670f08e84ec35a27d2cca2e466b6d328381328f5a514cd90"

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
