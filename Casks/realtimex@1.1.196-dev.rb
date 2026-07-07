cask "realtimex@1.1.196-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.196-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "cae586644b7ec45bfbe3de35c8ebbe0ff30c612d7394171c11c5099d03c9fc12",
         intel: "be509ef4b5bdb450470f4c19cc9f7b70de21fee773935d6c2564cdb356e81a5a"

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
