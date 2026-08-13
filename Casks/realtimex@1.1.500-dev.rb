cask "realtimex@1.1.500-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.500-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "57f3f181e985fd71d07da2933a70e5b6e66f435f253598833e142c79ff69e436",
         intel: "2dff261b30b74c6985896222786999faa93567788a5c18f4d3f8e981bf505980"

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
