cask "realtimex@1.1.20-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.20-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "50a8d40acc984ad96565625f8a01649a3e13c729326d66479a9b80c6ee7197b7",
         intel: "448cde11b56fd3112ed8cff3682cb5f88f175e542907fe543eb2ba71a18db285"

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
