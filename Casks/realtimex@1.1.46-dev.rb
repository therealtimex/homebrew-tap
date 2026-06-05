cask "realtimex@1.1.46-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.46-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e8f00d7edd9963b698ca1b2bdba163f7cc7926f25d32b3dc79ce9510f43fc573",
         intel: "cc71ddddc84c683377be604c15be2ecbb5d7e565c9c8a4bd248dcd0e25c0e7ee"

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
