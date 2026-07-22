cask "realtimex@1.1.336-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.336-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "dd49e15a75f34aa693fc44394a3d8ee48b99d985317d095394d20324cf4718b7",
         intel: "9275b70be433b58de803e24bd9f157403e933236fba13a4ad4b78935e1ebca44"

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
