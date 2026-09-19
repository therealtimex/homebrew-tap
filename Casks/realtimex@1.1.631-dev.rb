cask "realtimex@1.1.631-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.631-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "cf1edb3333db28028f074f1f962a5de5fdd45e57e2dc709b230cb8a3bb06a85d",
         intel: "e3f06de9ab89694064ee1983508eb892461cdcf6a5f4af2bc11ece60f375fec1"

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
