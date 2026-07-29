cask "realtimex@1.1.383-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.383-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5eb2130a20c9b31ce4ca73008f4b3f22d2c90eb2722e8fc8287a101742316a8c",
         intel: "f4503212a54ced8e151c5617a665203b986216e7294aafba0c66f3b2b9492329"

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
