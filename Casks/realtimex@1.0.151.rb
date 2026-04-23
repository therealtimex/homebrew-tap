cask "realtimex@1.0.151" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.151"

  # Provide both SHA256 hashes
  sha256 arm:   "6d12c437e47ac59430d2f7b2385e0e2c1334b71ef5dd87acc3f6d81ab09859a5",
         intel: "422d2f5b016df57924ec2aad1806be0214b401277bc2f8fd05720f5a9a1858c4"

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
