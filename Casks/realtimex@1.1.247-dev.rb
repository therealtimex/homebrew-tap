cask "realtimex@1.1.247-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.247-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8b6b1d8b4d7b5d104ba8a61d5a6d10177a4d5e2c3e345e8fa7ef98c760813425",
         intel: "0cc16be617a3080a881931d8a5451e0c8f4823b7f9d749e214d40dc6f95a848a"

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
