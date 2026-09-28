cask "realtimex@1.1.671-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.671-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9b01d987cc6b92f7a8b284f1c954ee5a030ee54860c6c385e48b5761afa31275",
         intel: "834bbf540a2b639ca58d50bf7efe5e44499b41e1c5c8232b8b9ac170e8456d87"

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
