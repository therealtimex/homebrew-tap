cask "realtimex@1.1.407-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.407-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3c56cd31b8d74ea3f9110ca918899067c244727343fb9919e0b685d42bd07348",
         intel: "ef4fb788fe9c293c8c8d8610ef77bd16dae1ffe36f750cfe8841d372a3fc060f"

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
