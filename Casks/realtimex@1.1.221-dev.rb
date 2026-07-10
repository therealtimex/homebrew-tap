cask "realtimex@1.1.221-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.221-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d4841673cd26af6228ed6fecc62b41f961dc2b6de16a401cf8415b26d00731c5",
         intel: "4c9602b4e01e266627f12bd13d5c3caa2ff4007fa9ae69e702edb984590145b8"

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
