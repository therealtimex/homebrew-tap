cask "realtimex@1.0.177-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.177-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "de65e35ee3766b1fc253e93354f8b9df62e5b49c676407e3afc17f79a0e1a53b",
         intel: "4fd2395fc86a043820f1c1895ea7c2d648b884b29e27beab479c2d221f132368"

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
