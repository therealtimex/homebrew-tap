cask "realtimex@1.1.520" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.520"

  # Provide both SHA256 hashes
  sha256 arm:   "e869d31314a18f44df00f05596de8205e37b612bb095bc4671d491680ec1d5d5",
         intel: "2ccb2ab705606f912b36b750510001c8d6111da510bf2a7eb45f6fec87003f20"

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
