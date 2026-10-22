cask "realtimex@1.2.88-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.88-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0dbddef3036845fdbaa6fd391fbdab2799df86183b424560db67c1e87acf5c52",
         intel: "44f261652ce6f07284c373a66236d7819c157ff876ed3a77fb27c334a47c94a7"

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
