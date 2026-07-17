cask "realtimex@1.1.281-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.281-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a5fcc533090f6aae9c3e2b58dd07d2ca8d0df757c4796be6b0fa4e1a91bd7215",
         intel: "bbdc93887229b43182f7643ac88dd0a6d4ca50284d6b0e22ae7dbb08e7f186c4"

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
