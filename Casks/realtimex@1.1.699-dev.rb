cask "realtimex@1.1.699-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.699-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e361007825f33c9e13d8cd44f8026e7cc1f28097cdb67b9760b0247a183bcbbf",
         intel: "1bdacd6194fe4358f135b8a9bdfd97b7c744c60f988a8bbcbefa37a4a30c4637"

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
