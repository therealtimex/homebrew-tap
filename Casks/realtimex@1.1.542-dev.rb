cask "realtimex@1.1.542-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.542-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "bfe0282ca777a4e3ba172d004f5dd87383204461fc06f94ba1b8030069e80b87",
         intel: "f83367bec1b19a2e64e667ef7478f38bb70a4ac275183cdd16a2bed95472635e"

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
