cask "realtimex@1.2.207-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.207-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4ec32fe173999098d2c9daeae2f4fbc5745d3e41fe892111a3d750edfda0034a",
         intel: "1db84f3c4476b6399603c0c40508015fec8fe65181916a6cde02f07fc62df91c"

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
