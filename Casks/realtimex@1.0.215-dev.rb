cask "realtimex@1.0.215-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.215-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7190655f679e0b44e12216424332cc482f631bdbd8756f87b84b9e41fe292170",
         intel: "c846938a1117003da57e24e4ba0aceb4dee49f4f65b062a3f5e76c6071942ad8"

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
