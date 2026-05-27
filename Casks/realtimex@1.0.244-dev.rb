cask "realtimex@1.0.244-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.244-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d4bc3c926b267b4c5f118eb1aeb0e0b4c054d40ad040f93a9ef01f8aad4624b7",
         intel: "3bfaa41fe774a766261af13e69c9ef9fb66815a3f97a0a9e61e65c63bbd8cf26"

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
