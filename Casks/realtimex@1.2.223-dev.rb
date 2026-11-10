cask "realtimex@1.2.223-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.223-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "32f6147e56950c26f234e33f10f572a9ad36dea0c267598a008e7ca92484efb9",
         intel: "72f53a1cf1224d509ebc29bb96780163613b5e360d64c84bb9cbbca138da504a"

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
