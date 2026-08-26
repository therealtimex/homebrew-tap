cask "realtimex@1.1.540-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.540-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8cb5f8dd265339e460b5c9bd93b0a5214edcd3171df2976dc4a25608d43e9b83",
         intel: "462bd8e8675969c584be6d64a03f6f09129ea2f58fc552b8955c75c02c61d5f5"

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
