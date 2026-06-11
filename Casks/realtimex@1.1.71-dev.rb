cask "realtimex@1.1.71-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.71-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "cc2e3ce4afb4ea9071fe6d015fbfc805cb6864e0933df967552a4afe5f29a919",
         intel: "cb71993a19eed5aea8474f09e97e9a018f20b9bcdba89d7235e0c79c1c029bee"

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
