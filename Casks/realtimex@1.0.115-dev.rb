cask "realtimex@1.0.115-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.115-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b30da7cc493db15c4a93eb1b66f1b68049de2b062d17f22ff06d408e7534efd0",
         intel: "f505b4db3b32e69c05f2133f737cd7ccedcd6159f158fa7b4a78320d7388ef1f"

  # Use the #{arch} variable in your URL
  url "https://github.com/therealtimex/realtimex/releases/download/v#{version}/RealTimeX.AI-#{version}#{arch}.dmg"

  name "RealTimeX"
  desc "Find powerful AI Agents for RealTimeX"
  homepage "https://realtimex.ai/"

  depends_on formula: "redis"
  app "RealTimeX.AI.app"

  preflight do
    system_command "/usr/bin/osascript",
                   args: ["-e", 'tell application "RealTimeX.AI" to quit'],
                   run_as_administrator: false
    sleep 2
  end

  caveats <<~EOS
    RealTimeX.AI will be placed in Applications.
  EOS
end
