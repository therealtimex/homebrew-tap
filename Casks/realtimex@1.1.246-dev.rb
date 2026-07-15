cask "realtimex@1.1.246-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.246-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e986bdbbfdb93ef4e79aee282d192dfb602dfc79ea0764bf6b158cd164cffdd0",
         intel: "fbbf91e3a3dc3bb4b7999c035d688e7a0e31ea19f7d5df6d9b041ee72e83c9e9"

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
