cask "realtimex@1.1.646-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.646-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0f4df92f410372c45b9ed05fdd59acce6420cf4bce8bbbf0dfc1081c2e0cbcb8",
         intel: "d70e82c487676480ad85dd658c1a90cc60bea20a2a24bc00cf4ddbc5a6a8795d"

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
