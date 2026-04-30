cask "realtimex@1.0.164-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.164-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ffbd346c33314d11a0f865c303bb380769ac79f19f219a29bed696255ca29c6b",
         intel: "9ab754a1180fc94374449b3d5ca0b94dec526668c895c7fe8ceef4750798f3f0"

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
