cask "realtimex-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.51-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "eec297c0e584a65afde72b665047677b6d5d4d19e5d175096b3d40ab0dd0fe5b",
         intel: "2efab76bd9233970dfe2fbd7f574dfb9b3e085b1cbbf7960d26d2e80e8f68d17"

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
