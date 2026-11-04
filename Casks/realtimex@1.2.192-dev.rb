cask "realtimex@1.2.192-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.192-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0dfa7989756034ef86b05e276100c2d5f6682d333eda748795155a8afe0fc9a2",
         intel: "c944a0a9a221906ba139e8668c8fcae9bd6fd990ecba7c36cc8f65a14097535f"

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
