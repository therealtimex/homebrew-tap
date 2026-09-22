cask "realtimex@1.1.644-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.644-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "994f05f77388e80587368d4ae6b3983630e93e4432da11d7e298bf35c035859a",
         intel: "71bb0c0b3f2fc8a7982a6d5ac50851ae7b1dd8dee32dc82e86ea39e772632318"

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
