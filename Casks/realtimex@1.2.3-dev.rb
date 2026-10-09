cask "realtimex@1.2.3-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.3-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "96229719167acf51c7ea4020de2dbe02810708d081a0bf3bb2d7dc699525df17",
         intel: "c2505d3c878109b3b8d5ace9f249afe57d86bbd63c94c08e6b0e3981e69254ab"

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
