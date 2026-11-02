cask "realtimex@1.2.172-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.172-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a67aa21c689e75993d003e453ddd60019e88732f4919ab0127e0c2f3020a4f83",
         intel: "e47064bc4a7b0d024ee327ac294ca32be9bc97910718eba677d7bafd90ac015d"

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
