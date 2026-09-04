cask "realtimex@1.1.578-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.578-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ab8c6c0462d82329c292d9d5e72c010fd7124f9659161abc65f0804b3b6b9dc6",
         intel: "de4a7b887462c584edd67871aa5b4270d398db4161efeed64ecec732daeea259"

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
