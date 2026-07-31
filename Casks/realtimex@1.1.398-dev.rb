cask "realtimex@1.1.398-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.398-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "411a62abc42da550becc54cf975ac6a16d073523ad1a6695d6f1f4c0373cfd74",
         intel: "49f60b3ebd9597b7ada679d52cb97c2b179c9092abfc72423456690b8ccfbea6"

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
