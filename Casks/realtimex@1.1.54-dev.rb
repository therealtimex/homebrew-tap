cask "realtimex@1.1.54-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.54-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "18273da2defba7b86fc75d85711af0e23303001a26b51efb472659bad7a1bc01",
         intel: "179866aa97a84f43056afe5c38734f3d8b79167850dfce8f4b151c17ab241e67"

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
