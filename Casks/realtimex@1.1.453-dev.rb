cask "realtimex@1.1.453-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.453-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a749e8a5d9be8b81f21ec53520a73b3261412a61862c8ea85c452211c519bf2b",
         intel: "1e26478f2d7d97659a227e29e2ddd132e4262a4e5e8bd0989078fdbefc3dbc71"

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
