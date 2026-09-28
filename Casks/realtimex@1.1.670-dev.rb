cask "realtimex@1.1.670-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.670-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9fa9235e89b8e88d01f11e4ac224ff69585e2923fd8cd359195bffa1c0854dc3",
         intel: "29e4d222d43bfe920087aaa0e0f6f67aba264e66a6f0f9954ab0baec448b9523"

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
