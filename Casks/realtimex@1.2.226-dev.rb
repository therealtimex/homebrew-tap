cask "realtimex@1.2.226-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.226-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7f053440cd6fc51106cc85d51881bfbbf07abc9ea98b4b1b65158d4d55f8536e",
         intel: "d7e6e0cfb91cc14123565bf0a352ce69e7e9ea0a1310eb92c5941c21975d0df5"

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
