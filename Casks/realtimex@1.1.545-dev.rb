cask "realtimex@1.1.545-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.545-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "774abe05be696912770c7c6e7ff59b2eaa2e523ec6d7a7dcb98d169ee8b5ce32",
         intel: "ad721694b01ed6360360225a5619beed14b6d3a8010108e671475e48aebb5442"

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
