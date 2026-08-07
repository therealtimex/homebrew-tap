cask "realtimex@1.1.456-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.456-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e4c401cb78a72753cfbd5763f68f43ebb43695112258d9c9db0e0d3bf0e3561b",
         intel: "08a884b83cf5df29dc2d5bf7202d0c54a2e586b6aa0148f05c56e9fccc6eb853"

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
