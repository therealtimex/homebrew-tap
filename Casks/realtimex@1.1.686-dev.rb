cask "realtimex@1.1.686-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.686-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "26fa7d4a144b770f6e5c738e81a6142a25894955e29b3fc60956a88dc096c617",
         intel: "91762d2fdb3f7c600623469f5c376dfb239f1bbebcf90478b7bea217a64f470f"

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
