cask "realtimex@1.1.237-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.237-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ce7ed80fe227e224085898e5f426eec4933389674c09a81975a348e28c6c0885",
         intel: "6251f518320def23bd73e8d9040122fd78cba29ceed55519676462d5f757ee1c"

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
