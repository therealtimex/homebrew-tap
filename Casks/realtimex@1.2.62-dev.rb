cask "realtimex@1.2.62-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.62-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1a1dc5e65393f0f35904d3deb205c12ccc92cb137828b148b6375513cb82384a",
         intel: "ad21bc6f98450a2d869fdf6f3b24ba830e81fafce0d22ebc05c65c9b4090aa86"

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
