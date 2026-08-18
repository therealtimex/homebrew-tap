cask "realtimex@1.1.517-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.517-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "69eebf98f3864aa75d784de38437c0e6b3f806aeb5f20492632c22e58893de32",
         intel: "215cc8c0b2c832561d47f822fb6e1e59ee940c05dd6db08d3c5288325219c626"

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
