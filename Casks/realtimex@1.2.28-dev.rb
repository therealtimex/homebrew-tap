cask "realtimex@1.2.28-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.28-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "54fb68dd7317f081b07b7edd2e79f327c91d8cd798f171e56a31f5ebf98cb8be",
         intel: "2417e7eef77b699f0c4b19602656995c05ff727e95f2f94c2f8891bc07923f1c"

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
