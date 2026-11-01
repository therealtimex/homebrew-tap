cask "realtimex@1.2.163-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.163-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b696e027851ece3b887209c95602f3ab72798b89eb75c7080e55cf3a48a03329",
         intel: "89b4dfbe46e65243b6d56930a3d20013d00e6d6fa13e5c2e52e33f6690c4a292"

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
