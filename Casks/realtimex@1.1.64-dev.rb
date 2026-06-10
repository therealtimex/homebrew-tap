cask "realtimex@1.1.64-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.64-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2dc9351e65925d5d9a92c94292762379c3ce780edee7c89c3e70d167e3ff128e",
         intel: "a7c2d11cc3524767f08812ce0e68144b4c8cecb9b8c15182699c9dfa24d56546"

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
