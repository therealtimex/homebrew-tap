cask "realtimex@1.1.587-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.587-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9c53052b730b033dbaa3decbb954d12eb0f7909342b1d07217f72659aa35350a",
         intel: "6c838ce7586ebe0db4417043709fd1c8438a22d4134f2fc6f972ffc22a3ed352"

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
