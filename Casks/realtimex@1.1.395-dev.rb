cask "realtimex@1.1.395-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.395-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7b101f9fc0ed6ffe6d5d10365e7cad3b2cda719eedb8fbc71b71e875ba6ceaac",
         intel: "411e16aafcce1734a1a63b5c80273f99499aaf38e97ca9e7da148330ad2f4fd9"

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
