cask "realtimex@1.1.326-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.326-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7b208efe96b871b919101fe4ac57f931b4dacda9ae0dd2906115f03c6b865ab0",
         intel: "71bc7aabcf18f2c9c500a7ebef5b6c91c14994b4fc71af6496459ec9ed783763"

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
