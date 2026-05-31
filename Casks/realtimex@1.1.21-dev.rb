cask "realtimex@1.1.21-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.21-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6d669ecfe67441c9cd3bb1953f0156054578b3977d28f515221d678cc4f5d04d",
         intel: "d7e9a9867c55335880d9c6ada6551262016c2241a9066b1a4aa316a0bda486db"

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
