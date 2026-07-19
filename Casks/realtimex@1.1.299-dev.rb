cask "realtimex@1.1.299-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.299-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a275c2ea7cf0a051609d1c54129272b9ffaed0cfa0437288354b08bf3b431b63",
         intel: "040ee1a091d7ebd0682e022e0a1b74cc20078ed47442105c0ddf6d46ab8921f5"

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
