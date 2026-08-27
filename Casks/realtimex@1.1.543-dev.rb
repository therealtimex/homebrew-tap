cask "realtimex@1.1.543-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.543-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "cec066287919fc5fe56120ba78e8e9d85c79788afea581dcb4dc3b59ff00281b",
         intel: "2cc8370a4ad6958b9b00cf40ace38913ccd1a3cf1a1839b88e53ad90aa0e4eb6"

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
