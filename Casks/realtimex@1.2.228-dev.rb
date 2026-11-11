cask "realtimex@1.2.228-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.228-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "759302aa9f48f5e2dffdfee20f34be7a1b930489d9e0f074fc8fad78575354d3",
         intel: "612d4d7e1cf097414308cd93b2b4a0263ec456212b84d2f4e1520aad878b6218"

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
