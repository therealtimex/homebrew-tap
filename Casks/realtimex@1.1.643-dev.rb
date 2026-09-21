cask "realtimex@1.1.643-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.643-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1c78ce1a2a0227b8a8f166eecb821ba50860818f963b23b2bfb2ba0d83bfb4da",
         intel: "5f957349f17216ac1c9f5cecfd1d6670c3067d880685a3cba73dee0b63bc36bc"

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
