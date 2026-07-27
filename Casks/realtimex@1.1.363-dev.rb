cask "realtimex@1.1.363-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.363-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b6b9c5a8de68a67b6b00bca22c83796c62770ecbaab0720fb80af3100572280d",
         intel: "4e43aff7cbd97dfe7e74336a57a446208c4a119dce7166e2c1ae10140fe425cc"

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
