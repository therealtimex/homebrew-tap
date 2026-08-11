cask "realtimex@1.1.481-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.481-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2ac470ba0d630a1168571a6c0c82004d9f83c871c32f593c37a8ab5678dfcb2d",
         intel: "4e1480b766095d7def8e61b65cd1cc5f97cf513a6439afc78ee17f7729231789"

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
