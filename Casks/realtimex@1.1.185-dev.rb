cask "realtimex@1.1.185-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.185-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "bf4c3f6fb9dfabed95ae802fb4eb4a430a62850abd25dbddfe0a890a4e1923b7",
         intel: "689eea38a2d62cafb6da3b76bd467b2b1f9dac37c1a62ce375e8ec57a1f29aad"

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
