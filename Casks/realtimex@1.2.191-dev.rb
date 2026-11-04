cask "realtimex@1.2.191-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.191-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c1236b826357a717da8490b43e4d0783e2b790352b023e8d5aab651b8b52946b",
         intel: "f6c3c3ef00217b38b5f7ad2fadc7c3db4bd463e566b2eeca77cfa1a53339680d"

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
