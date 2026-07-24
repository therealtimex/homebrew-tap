cask "realtimex@1.1.349-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.349-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1ae37bea0def360cf2a405ff6a28b3e1efeace00c1737e045aa38437b0de3e6c",
         intel: "f80934d812f5e635f3fa8c9fc8a374a59cc460cf88fc4b2f59bdeb684d80f9b5"

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
