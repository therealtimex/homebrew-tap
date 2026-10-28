cask "realtimex@1.2.144-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.144-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2b72b33ad9e2ad06d72ed7a13994f12bad36f56d563a2ff3968df08002458607",
         intel: "95f7ef0a9a698d873013d89fca964db23bb0e4caa8043479f12a33be45ae1a9a"

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
