cask "realtimex@1.2.115-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.115-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9d018040cd5e25f261b7c04d2d142a1171d5c12db3d346c849f7edfe547e7570",
         intel: "f0345d42459e6f879f491d72a62427409da1661ff491a1db50d108825f2510c7"

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
