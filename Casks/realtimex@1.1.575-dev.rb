cask "realtimex@1.1.575-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.575-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "746235aa5d10a268b537f81ceeab9e59648213efbc1cb9f75e054d1bb539373b",
         intel: "212bd8780e532a3f9d360240406f610ec3635030e126cb06ec3622b4d2594a0a"

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
