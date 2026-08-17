cask "realtimex@1.1.512-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.512-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "790c16555646050ec566ed4f13f8ea32b2aafb8d6cf625cd7da7473ba1b713b7",
         intel: "050ef426cb4cdb652dc4b3e86849d0c46c4582b1c634be8561b9939da8b78323"

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
