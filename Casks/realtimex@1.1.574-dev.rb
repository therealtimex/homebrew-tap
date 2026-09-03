cask "realtimex@1.1.574-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.574-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b802d5d821bb5c1e7f2420ce81f6413e1004c3011498f5c7d8ed5804d7100c13",
         intel: "ade0ffa82a8c72319e58b58039851442531e3f81af46c217bb9ec3ae29935be2"

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
