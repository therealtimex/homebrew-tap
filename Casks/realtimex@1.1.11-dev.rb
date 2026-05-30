cask "realtimex@1.1.11-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.11-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "473dc25f1bd71f55c155d24eb02bf1a00cae74b9e8d44a6999b7db6454672cf2",
         intel: "3f6851974dc4b48a787e7ab4c806d9084e2e1b7f512846d0957f3033cfeaa5d4"

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
