cask "realtimex@1.1.669-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.669-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "914cf433bd87f2719d4a93cad74085dea0a3850d860668f61432ea74d2ff6741",
         intel: "6e80b85c6c6a0f0c96636c62c2312040639bda3f9aa0ccc4a74ba8f0d362adbd"

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
