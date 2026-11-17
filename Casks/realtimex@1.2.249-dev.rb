cask "realtimex@1.2.249-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.249-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e8f3125fad3321231113b9a20614449877384e83dd2b437b46b2be1837a2aa9f",
         intel: "2df185c501d31e7b1c2e65b6c2fdb3f0e0445c0c7afcd9e3c8ead55a98075fa8"

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
