cask "realtimex@1.1.229-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.229-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9e237087a87fd80161d03624abb88598080c60b14da6c338d4bb6b31b3f8f4eb",
         intel: "4cba4b83b3bbd45d9fdb31e63d18c9a8443718a3095a3a5690a788cb55f69ca9"

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
