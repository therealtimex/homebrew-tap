cask "realtimex@1.0.117" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.117"

  # Provide both SHA256 hashes
  sha256 arm:   "cf56f2911c3f95ffe8cdecb2da2b74a309f62aadb062c6eb98c25e35ac5f7559",
         intel: "7f120eadefa28b8eac9053741f2a15bf8b53295fc54e4cb104b61273eac0a534"

  # Use the #{arch} variable in your URL
  url "https://github.com/therealtimex/realtimex/releases/download/v#{version}/RealTimeX.AI-#{version}#{arch}.dmg"

  name "RealTimeX"
  desc "Find powerful AI Agents for RealTimeX"
  homepage "https://realtimex.ai/"

  depends_on formula: "redis"
  app "RealTimeX.AI.app"

  preflight do
    system_command "/usr/bin/osascript",
                   args: ["-e", 'tell application "RealTimeX.AI" to quit'],
    sleep 2
  end

  caveats <<~EOS
    RealTimeX.AI will be placed in Applications.
  EOS
end
