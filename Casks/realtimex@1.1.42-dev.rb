cask "realtimex@1.1.42-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.42-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "bef46d51200919709e069208c196afb761481ce779c61797347c2fd3514ef557",
         intel: "56a9f46f0cde1f69d03c301c789d3555a8e7566a2bd75606d088f129dc2b2f92"

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
