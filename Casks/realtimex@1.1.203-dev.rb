cask "realtimex@1.1.203-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.203-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5afb98deb762a754b932c6b249e0baea7efe755db1d5adf28ceb88d96184a3b9",
         intel: "74b5923a7f75e702306f833b789113458d31648e867a2b7e2743f1722a810c06"

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
