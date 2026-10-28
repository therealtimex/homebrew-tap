cask "realtimex@1.2.142-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.142-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5589442e916b6ad07c04fceefb79f11a6fbb87c1025320747ce846cd1d44ced8",
         intel: "d5b08e7cb1df16405d7eb3a5d7ea2c6e44f9da1767df26f2aa2eb8b21985dc07"

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
