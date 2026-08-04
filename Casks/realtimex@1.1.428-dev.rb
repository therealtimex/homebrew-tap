cask "realtimex@1.1.428-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.428-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8a69c1527f67558c8b150795e29723d16513e1b22f382d157d56764dfcbadca8",
         intel: "07f472b5ed814c8fba8c0f0d4f67bdfca4dbef3859676280b1cc23f10447806a"

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
