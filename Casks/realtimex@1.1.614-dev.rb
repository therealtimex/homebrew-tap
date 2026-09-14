cask "realtimex@1.1.614-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.614-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9e2ae5624b7a8c85ebed79de32fab55413e19034508e79a327af45aea3128f17",
         intel: "564b03c764396c81e2b64461d3c13925ad1b6f8c1374d476f4693e0a3286c6b8"

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
