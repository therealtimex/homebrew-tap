cask "realtimex@1.2.278-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.278-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ee9da44ffe7dbc7cf7ac61d8a856465090cd8d8073bbfb9e049ddd232c3ba407",
         intel: "9474fa6d0dd76f2a1e455ac306b2a379ef0c9fe82c901bba0f771087a99ef041"

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
