cask "realtimex@1.2.16-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.16-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "448142a7fe2c653c8a0400ce5201c721992be796011a3b3b5129465608fc9ef8",
         intel: "a98d5367f8960a4842edd974ee8618247c5a6801bfc7ba794ee0cc3d092a07d2"

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
