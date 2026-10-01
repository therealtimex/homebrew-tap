cask "realtimex@1.1.688-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.688-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8a41e471fe2700c5982fb1abe92e63f1d2cf61df594dc29dc93cfe4eeba8e350",
         intel: "76fc8ff7f563515a09cdb1c5b74d6b036fe50b9aa6a2c823eea1f9389f5960ec"

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
