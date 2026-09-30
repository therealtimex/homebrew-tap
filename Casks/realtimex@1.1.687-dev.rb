cask "realtimex@1.1.687-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.687-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1c00d61274c39572a6410c5aeee14300b54207239d26ad09bbd1444edcb996bc",
         intel: "7a8a29b5ed2196c900b915f3f9f3dd6ae91f25eef764809c675e138350df5d95"

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
