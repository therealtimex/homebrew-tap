cask "realtimex@1.1.659-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.659-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e3437d146466a1b41d843fc41de6ee035bde6cadf592df04957689a20a1d738a",
         intel: "7083116f20ecd65386059913a97b1edaf21813749926d58cb57a68c2ddef443a"

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
