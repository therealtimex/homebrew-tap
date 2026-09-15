cask "realtimex@1.1.615-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.615-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1f4baaf80e5c830a1ec13320b9d443b045ea29ed14d13ae38b2f4e02abf9c684",
         intel: "9ac156876d911bed9c21eeeaca84256b26290ac9dd70b8173b027b22fe462e44"

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
