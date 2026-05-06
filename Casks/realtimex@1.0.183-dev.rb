cask "realtimex@1.0.183-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.183-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c869a1b87066a5e769feeb53f1aec8005ddf1b06f02da476d741702b7e1806e2",
         intel: "12ad42d71d7348b5e14a5608ea9b65bff46c73687dd57bc95d7743f48fc864bc"

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
