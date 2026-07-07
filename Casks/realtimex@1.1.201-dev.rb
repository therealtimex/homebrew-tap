cask "realtimex@1.1.201-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.201-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b9b2ba31c3988e71d35f2a19140fe8e2dfbdd9562a40f4a42a4c092031c68470",
         intel: "ed6f40763aadd2f44d28eb195ee64cbe10070c5ce0cecdfb2f0be97768c8c6a7"

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
