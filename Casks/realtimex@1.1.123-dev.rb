cask "realtimex@1.1.123-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.123-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f370644cb7c3c1574242db11a90053e45f18a98e9b66618c0d2e2e11cbed3aca",
         intel: "4f3cb775d309b588384f78e742616d40f30442c1acb337d999c697da5c062276"

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
