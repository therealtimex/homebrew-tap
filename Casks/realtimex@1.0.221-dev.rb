cask "realtimex@1.0.221-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.221-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e5a009dc1ee7951f4820f092a5fb6cc09b436d9941699de4ae66d9d67f496f10",
         intel: "d9a7caf4d27c6db7d3efd68a2f0ed18477a05ebd0c8af37321ed2899b13a6cec"

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
