cask "realtimex" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.83"

  # Provide both SHA256 hashes
  sha256 arm:   "5652891aa4f0c75cf9b2e9d7f60ef83345f6a5cb9b8490ab7c15efba2ba06a3e",
         intel: "7e29a0db447f1e20d40e03a76224a47db93630b192f01128ad11387f08e4208d"

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
