cask "realtimex@1.1.106-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.106-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e73839effb1471c3270656d624bc1d43ba0bbe4a6906cef0f7303fbe64ba7cc8",
         intel: "1e87c3aa3b4d43f79d3ba43e6e2646caba90913d46bf8223638d9fc092732e61"

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
