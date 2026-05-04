cask "realtimex@1.0.171-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.171-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4558e20352988d2420876a7c5361f9945b33665f7a4dcd36d8673fcde3826437",
         intel: "467dad4f1c368d8d960746f08a4325a88af59b2354b86fa0098a1b7190f9c6b9"

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
