cask "realtimex@1.2.76-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.76-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "701d3a10efea49d66fb1326728fa53ca4e7b32e7135e40684b744375faeb5629",
         intel: "0045af9213ee6808244a7aaf2d944ca0f67eefc9e7490b3c5f5675f1efe3d0b4"

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
