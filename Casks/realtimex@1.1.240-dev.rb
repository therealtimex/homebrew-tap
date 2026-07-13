cask "realtimex@1.1.240-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.240-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0bab9609a2a703febcc1d40cc9a586f3cb5d91ef62b6410552de9127cbf6f95a",
         intel: "7a7da7eb4f3d32dfea807713282de2bd37991885c5f45d645c22c9f64466a4df"

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
