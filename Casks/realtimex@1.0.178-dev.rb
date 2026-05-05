cask "realtimex@1.0.178-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.178-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ce6dea89de58a9316914669ae985e210cab793d87b8aa640d8558a08a996e1ea",
         intel: "a4441a405b637f10c42c0beab04f7f77d554208dd4fa9ca9784888ee2c783af3"

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
