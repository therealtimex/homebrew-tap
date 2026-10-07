cask "realtimex@1.1.707-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.707-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f420944b8bbf2841e5d8fdc4deaeb98f618caf8fb432ac65c321572129c4f22e",
         intel: "f371e35d1a6b0bbc80d3ccd50ffd747675f5e4d91979f6a1e497e8084dbf8601"

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
