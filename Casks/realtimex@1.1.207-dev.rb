cask "realtimex@1.1.207-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.207-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "36fa61a921c8385035518499e728ffac74aaafdf4dc29fb0edbed292094cfee5",
         intel: "b1192a9d7e31f4631f2e4e2887aecdbbda5fe047b0ca3b537def595ce05b38d7"

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
