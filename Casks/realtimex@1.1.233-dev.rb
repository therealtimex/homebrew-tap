cask "realtimex@1.1.233-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.233-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c600d1f47e5fca5d305106581a70d6bc5bf77e0c748a0950fab04ce8648ff0b3",
         intel: "76ed32e55ab6e8e73c13331b66a124e1611eea01ae82ae30d2f097acc17165d4"

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
