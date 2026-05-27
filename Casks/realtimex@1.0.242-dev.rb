cask "realtimex@1.0.242-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.242-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f3750343520b0f49ead1b8c007f20a69c56c51e2164995b35fc2d6545c5e9b44",
         intel: "0aa6b5b36de2d27e0f82f85df7117eb36795dca3d368c2147062c45a94d576c0"

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
