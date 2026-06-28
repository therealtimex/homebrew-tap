cask "realtimex@1.1.153-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.153-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d4be316ab8f7a3ad62207048528f7824c5256b80c45539bad8fcb88c78aca433",
         intel: "a6114c3e34025d034f66d5ef56505d0159e6cd077b8a54d2f8bab41e4c50ca22"

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
