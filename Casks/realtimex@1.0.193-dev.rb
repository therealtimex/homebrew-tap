cask "realtimex@1.0.193-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.193-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8c0d880a75416dfd60f5394c681915525e5dda1a4bebf30a16e1982ab85e6589",
         intel: "23cff2e8c4679532c3be2ae6d2a703486c71731cb7304c20b03a4dfef8c540b2"

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
