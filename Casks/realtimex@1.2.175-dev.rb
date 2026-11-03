cask "realtimex@1.2.175-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.175-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "bbcae713967b006d5c1c3fb1079e3433b2e4d9c02d5e9d6363d9898353f512c9",
         intel: "77e852cea281838a87f2faa7cd3e55b226e29c5c9efbc0ef3d5d98bd018023f4"

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
