cask "realtimex@1.2.213-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.213-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8123c9743aebcf08fd76afeb85c817d7a01f872f7a8421eacecb8e4982f4a0ed",
         intel: "13205a24a1832909c6d71b91739e272aefa5258235a7d04799b41543344ccb5e"

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
