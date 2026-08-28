cask "realtimex@1.1.550-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.550-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ba1ee3127e20b2e27522f445e2539c286eb3697c80e2ba55176704b8d1146352",
         intel: "3493c94ab59b7aa08e01041ec6bbc432157c373ac4d506824188e66211eac3c8"

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
