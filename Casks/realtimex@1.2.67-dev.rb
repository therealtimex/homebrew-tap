cask "realtimex@1.2.67-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.67-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "015bebb06f290f2d12d25a2982d45ffbf3e39fb26399a0836638bfe8c0600f85",
         intel: "52690a06dac1f418ed9dfe56b921718997ce1243de2bcf42829aa314c1c870d6"

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
