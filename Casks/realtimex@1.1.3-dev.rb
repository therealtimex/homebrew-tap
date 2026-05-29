cask "realtimex@1.1.3-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.3-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d2d02ed8a03f03c999f4f7b7e8620f26ecf2154d3124aef25a6edfe5bf246b4f",
         intel: "ba0d282d63482180d1b410576681b0c19f756284d2cbe71da6c0d292f032979d"

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
