cask "realtimex@1.1.404-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.404-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "bdf63c52c3b7e8916a464d70c47465b1e8b10602b3d1768db0351f86e2b684fc",
         intel: "695b23cae74c08fba277cccc5c6edfbbfc78380fafa2db309a3f737b5059c0e7"

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
