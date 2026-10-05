cask "realtimex@1.1.701-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.701-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "621a807d093312774d9bc2d6fcdba3628f8bf65a09ea1042c9ece92639115392",
         intel: "7f8f346ba669b6c3197aadce0aa29f711c93af673cdf9773a75a89f14fa631b9"

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
