cask "realtimex@1.1.414-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.414-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c34702c8285e82a7da08acbf961f8270b4b97935328a784240bf828e2e8d7925",
         intel: "f58ec36eadd9c04963f583d313907e2103a7ba8eec7b1900be3aa510cc7df164"

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
