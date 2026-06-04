cask "realtimex@1.1.43-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.43-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "48608780caf47b7aeea4968b0c9a331ff54048ef8b13237d0c140a7856b28521",
         intel: "c688dd3bb6d73852c824a7f1a75bf81c5dfc96c27a8e485979e40dd71b2f75ff"

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
