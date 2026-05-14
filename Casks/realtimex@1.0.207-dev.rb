cask "realtimex@1.0.207-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.207-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "43292da3cebcb206b4f7e9d732d44606a7d7e89b54913110973dce3743db2c51",
         intel: "b155b52cbc0e724e8018bf3abd8c15eae69c3ff5c111128d0e8b2cc2aed9c860"

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
