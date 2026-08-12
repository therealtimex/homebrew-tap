cask "realtimex@1.1.493-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.493-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "66f34ce13dc30cb00b87082b4d8ecc2c0102d1a47d548221229e3ff5c64fdd74",
         intel: "ed08c3116432a514f8c55fb927c7bc5403f1b8f22b4acdf3f6d9074b6b6b306a"

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
