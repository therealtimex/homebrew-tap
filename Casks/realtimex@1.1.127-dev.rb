cask "realtimex@1.1.127-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.127-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ea277de48a4c72de360d817f088ef5ed634e5651e5e7c7abe218fcc779da8c37",
         intel: "90f52859af5807dcd9034688386b5541e244578f149eac5454a07813fd888db2"

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
