cask "realtimex@1.1.535-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.535-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "89f9deb0420ac48c35bf2e74e266fb26829180bb86538a7d7b2a96e73bf22a26",
         intel: "dca3bb9ec3389db966befd3485926df437f61683454670f1ef4d0e8aa61a6406"

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
