cask "realtimex@1.1.464-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.464-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b68e0127301c53f10d64f60cdec00f78ffe1bf647efa2e05e61d3a7d986ae694",
         intel: "ffa6b4042d913ab7e12b2cb0a6300088e1a2dde1f866554fcbb7a099ba4588f5"

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
