cask "realtimex@1.2.143-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.143-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "49ca53ab0187dd2edac8668607b4e0f137b02aae034d4c5dee0a92ea679922f4",
         intel: "399443bf6006a1d86e9bd942ef188587f9e74457690770584f9a4b6935097efc"

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
