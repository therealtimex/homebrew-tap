cask "realtimex@1.1.581-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.581-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "249450c709df750ccd68bd97a1f1bda80804c499e402c7551a6c452771e9f809",
         intel: "20a9ea4f01d880d0a39d002850823ad35fc4ffbbf0830db7dd00cfbcf3d631a0"

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
