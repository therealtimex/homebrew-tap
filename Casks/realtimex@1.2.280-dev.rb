cask "realtimex@1.2.280-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.280-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8c3a4615117dd430f37d72d2ff16b4e63518c15510a76c9ed9738d19e793ff12",
         intel: "4f0dc577eeb8c1fa6d8dee4159f9f8a41dc0240bced6c81e1a641472f8a48125"

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
