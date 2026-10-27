cask "realtimex@1.2.135-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.135-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a35ae5d3d4fece4ea31591cd1e0d4a94e212c280758e7bbfeef14a39b564d295",
         intel: "073d50ff223924759637f2ea9e03b760979d370d1e5a6848c506b84b83dfcc14"

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
