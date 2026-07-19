cask "realtimex@1.1.305-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.305-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1fb882f71d580185f9041b84386c37e672d532da4b54f0e42ddfc61d9e8d80ba",
         intel: "21e7e747db626afc204ac573beb64887c611725aeb5ed83bad8422d192e16ac8"

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
