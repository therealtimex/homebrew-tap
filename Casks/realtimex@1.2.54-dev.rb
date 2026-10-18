cask "realtimex@1.2.54-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.54-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b61100a914e4acf5821e8e15f9236d5f61319daf3e44c8414c20dbb55028bcf7",
         intel: "a5aad1ad743843e00221235d64d1375c05fa47628cada5355a4a3fdd001e72a4"

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
