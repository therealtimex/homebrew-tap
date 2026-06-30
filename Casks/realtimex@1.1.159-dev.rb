cask "realtimex@1.1.159-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.159-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "920dc72cce94fff4c5de41e221601bdd2fec4bbfe162545f7dc39b0237c5eaa7",
         intel: "fdd0bda9deac09247fdc952661d13a22108fa4033aea7b70c0eac46684b3d33d"

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
