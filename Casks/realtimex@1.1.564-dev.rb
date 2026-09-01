cask "realtimex@1.1.564-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.564-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "71892ed820f5c78826adf42207f33428c07b67bb8a9a47a9cc5061c2e2755784",
         intel: "159f1a56fa02ec892a9add10995524bd57938681cc67ce85d1afce8e2514a167"

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
