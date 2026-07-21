cask "realtimex@1.1.322-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.322-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6ce76d846f94d23b9ca49a855d8e6c383885b6deff24d037cd14e36b7615ed8e",
         intel: "822ad4611040bd23072db97186bd247d9145c0619c9d91aec48a4fa9d4831036"

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
