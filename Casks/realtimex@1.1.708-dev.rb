cask "realtimex@1.1.708-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.708-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6d9b27768a8857709ba87813a0f4e56c06e0205782063306fddb59e5ea5cd3eb",
         intel: "e2476cad539e5e337694ec7fa83e78e0207b603f1e3d40080cfe3d1ddbcffd6e"

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
