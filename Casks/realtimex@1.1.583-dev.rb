cask "realtimex@1.1.583-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.583-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "34a4bd1a923f8a912136547ee728f4fe69301507d5f3e5b24f7096799ae9e412",
         intel: "bb06fe21c69693450bb0a492d871ca4610fcdcb9d03c09754d9ff23a82986bd4"

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
