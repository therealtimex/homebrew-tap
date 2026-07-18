cask "realtimex@1.1.292-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.292-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8c67b6e5975a38966f94bad068096f5d74fefaf15991ce0bd5fe3d8f873326ce",
         intel: "7d33bf7535c94082445ecb10159daaeaba05a77c28e1316d2cde8fe8c4d9a077"

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
