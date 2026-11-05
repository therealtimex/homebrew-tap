cask "realtimex@1.2.203-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.203-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b64f11e9d138f29c159d7701a4c4b0df7e9fa3ae5a2b0da80b390f6c20af99a0",
         intel: "f267322dc2cda17e957d0b517733247a562e8e5e3fa60d818a1985f7ca03cd7f"

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
