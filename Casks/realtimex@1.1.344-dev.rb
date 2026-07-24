cask "realtimex@1.1.344-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.344-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d38caf4792107c7f42eeee3e9a75bc8f0f590673f1960730ab53924c01efacfd",
         intel: "1b60f577bf106d2c5d4bcd4ac6cb28564b982da98c45e78c796a6d31b6430d66"

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
