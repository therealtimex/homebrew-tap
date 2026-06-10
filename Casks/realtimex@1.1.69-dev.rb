cask "realtimex@1.1.69-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.69-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d9aa6ac7d9102ee8db64f0c29761e7c71156a6dbd66d020943eaddee37de53e8",
         intel: "9ee2702fd9ed61a4426cbd2e561976ef1b8ce9a156e7c7ad59fae68b3c312648"

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
