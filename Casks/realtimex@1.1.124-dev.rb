cask "realtimex@1.1.124-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.124-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a707a1f1c730f1a03ae0978f458d3cfccb5b1a740f470ae1d9b0a34c1208cb6f",
         intel: "2ef1345ead9306d7380afc52adf3cbcbf2f1e9a5b8b9706cd2fd98243940528c"

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
