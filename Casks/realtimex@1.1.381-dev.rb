cask "realtimex@1.1.381-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.381-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "81de38b7412babd7b843005a2a3040c75d567233ca36075a633cc6c0484ffeed",
         intel: "7be312a48299d160deb3103a38b4b16773baa28d9d85c1e6582c84226e7ea5e8"

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
