cask "realtimex@1.2.35-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.35-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0f248a1f8853a7da4b195fc1b9fc3e845cd4dcb75e07a1b85a7764b962301eac",
         intel: "ce68258aa01b38f6967c60c69372912f415c113c0f3cad64c866463b9dfe26c8"

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
