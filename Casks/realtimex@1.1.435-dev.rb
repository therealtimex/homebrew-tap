cask "realtimex@1.1.435-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.435-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "47469fae744f780bf01a910fa85a480f749706e57a916bd6074e57b1e4d71441",
         intel: "94534e53eac5c0fc29a64173a655a0d480f8d092416ea67a3e7e8500a9b20882"

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
