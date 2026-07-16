cask "realtimex@1.1.256-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.256-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0cbf6dfa44abcdd68bae8c0b55e712418092655f3c91184597e42d1239f30bdf",
         intel: "640dc78d46b9bf8f847262e14d981bb38869886e6fd740d1648606c009f56a3b"

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
