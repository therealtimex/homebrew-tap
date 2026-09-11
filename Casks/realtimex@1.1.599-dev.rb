cask "realtimex@1.1.599-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.599-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8fe323066fb9dd7fe144dc51a33a5e7fc49dfb33fa4deb81a091e4d77696173a",
         intel: "3d95ed8483c802f2d7f394e051e87403ee7de150ec21120f7576e43bdcb531bb"

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
