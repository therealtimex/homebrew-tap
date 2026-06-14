cask "realtimex@1.1.88-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.88-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "dc20d7acdd1d6daa6e480735d54ba34fab50964c5e8c02db9aa33d64170349c4",
         intel: "98958c18b3c95afe477a30cdc9886ba249c593dd0cd6bda785037e1a85018fe3"

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
