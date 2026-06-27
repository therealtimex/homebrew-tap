cask "realtimex@1.1.150-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.150-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9b00ace5f89dc69cb0487ee42af887af9626209ee9b46292d9711e81346b90f0",
         intel: "d357c1d4336c6ee98c5bd45ea6489f0e5464919a347ee3eeb53609afdab8ca65"

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
