cask "realtimex@1.1.92-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.92-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "142c49fd92ff7c4ad10d75940cea7683ba7a51816580d5e3cb4b314005c004ff",
         intel: "8545974d6f6247f7c4522e93aae386a51f9f60ab3bf93c1ef28ae52f4687cd6c"

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
