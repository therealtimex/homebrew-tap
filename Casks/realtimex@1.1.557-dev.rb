cask "realtimex@1.1.557-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.557-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "19f0d329ff9e69fea2a6d8c3de56ec724566b363bce35683a374664624a8cd44",
         intel: "7888c2fe864243ab380768787ef648d520f16e4bd32ab8684cfaf753119cee39"

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
