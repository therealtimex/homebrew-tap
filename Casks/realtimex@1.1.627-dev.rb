cask "realtimex@1.1.627-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.627-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b8536916abde3d8548a95a61a4c098bcf7931f2cbea704b09ca50bc1df073f22",
         intel: "be461748e7e633a64d3af3cb012ce4aedd961da2e837d45ec74e9418da51dd29"

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
