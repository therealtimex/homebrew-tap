cask "realtimex@1.1.598-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.598-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1ceefeb706720338a7146be1dd2f9211be7393cb0a1eedea88ad7db4a66f6044",
         intel: "31605da6058ffb5c724c79448b13858df37bef379ebe2357ca7fe512ca971ede"

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
