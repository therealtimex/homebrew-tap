cask "realtimex@1.1.80-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.80-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2df456e69fe2dbbf70bc0a8f108b8a32568fccd7846bed0ede8efa73249bd7b4",
         intel: "3b13eae77d67fbbc759a7ef6895d76298ba7a0ec2bdbcb22073a17a3a865cabd"

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
