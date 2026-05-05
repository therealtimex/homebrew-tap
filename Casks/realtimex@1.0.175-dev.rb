cask "realtimex@1.0.175-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.175-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e260176dd78fffdc9f4a3022ddd143603881aa08ec5372adb24a2698c0725610",
         intel: "fa59f68faf2150e2e0e890ea109a62c790e81c4718119a490b190201085e0e4e"

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
