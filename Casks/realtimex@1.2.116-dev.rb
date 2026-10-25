cask "realtimex@1.2.116-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.116-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "411291b9bca92e0f015fa4309d5d6e2ad5fcf03ff138d1da0ceed3fbe3ad9eba",
         intel: "455d1b7543fc302757ec9e7337fcbfcb2463a39d731a50b7cb478ff95fccdbcb"

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
