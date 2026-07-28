cask "realtimex@1.1.376-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.376-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "deff483d0818e4c97818bcf339c8ca46c7240d7b557040ab490d5b028f8485ed",
         intel: "2c03025bd5ac0830a9d4a657dce5a78c3dda86c71df153c9203418185faaef6d"

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
