cask "realtimex@1.1.544-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.544-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "42e6f1546e91a57d99d2c21658ad3cdc680cbb9d475a93963a9a7954b05be26e",
         intel: "47cb184c9957a84ac7dfb18689147b9247c8595c65703bdbab3309081d23af94"

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
