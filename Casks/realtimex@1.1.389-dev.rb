cask "realtimex@1.1.389-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.389-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "30d1efe7c7351de6bd719342e878bacfd5a6eaaa5614c2f9e84e2b7162533fd7",
         intel: "dbc61cf9da7bdb6e8d34b37d27b1dee69403a6c3ba52cff48027ef2486ee023e"

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
