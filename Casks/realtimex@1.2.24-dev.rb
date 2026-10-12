cask "realtimex@1.2.24-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.24-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6e6a9b9bc6056f2c467eaa01c6327c5a3b68a789a4bf7c2bc0177ecf4fdd82bc",
         intel: "4550c5bc1472f204fe66960f185d9f95efd8aed2a48f6f3e8b3f643e64a4f315"

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
