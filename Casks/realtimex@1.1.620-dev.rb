cask "realtimex@1.1.620-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.620-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "762a59ec79f5ce0fb4020c9d49b68384a72b375c31976e60b981d6af7aeddcab",
         intel: "c0774b15a436625130461d786bb15a0e334f65b064a6d5c86887959437d93954"

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
