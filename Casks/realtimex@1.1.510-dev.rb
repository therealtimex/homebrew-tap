cask "realtimex@1.1.510-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.510-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a783f674cb1a88c06a56722a06bf85d21b3e0813fa8551f88b5e39006b42cf5b",
         intel: "4cfcb003674b9d59900fdf223d3d1a9a46cbb206d0885e848ae18cddb01ed7a8"

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
