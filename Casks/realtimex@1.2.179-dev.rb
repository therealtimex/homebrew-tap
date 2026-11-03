cask "realtimex@1.2.179-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.179-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9a3e68c1a5f105fd1e267a6e962429706d5b245fd64aec903bed7990f76185cd",
         intel: "6645e4880ac2d5a12cce84856e13b8ebfd033f9f65cb70492f3ea638a2bdfb3c"

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
