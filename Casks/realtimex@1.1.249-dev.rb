cask "realtimex@1.1.249-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.249-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "986c3e13e0a88f1840df4546e9a86123f5909c6b58c41f2653fa100246e72d9e",
         intel: "ea48ece089c033a28a6c44d1da362a7978699a7b88871a7ba495ad8cf20e14e7"

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
