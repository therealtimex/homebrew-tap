cask "realtimex@1.0.159-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.159-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "64b034a1ec4c5100110c9e005efc2aac6f494b99d601b17093e8be04f73d4f61",
         intel: "8bd0dd6666e965b98b9954ed18c617a6548c837b3010bb484a6b7b76010385ca"

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
