cask "realtimex@1.1.516-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.516-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c134731a7221623b75e0bd4c9ef82707e56628a3bf906ac9ca13b9201b650f31",
         intel: "1babcfbcf95bb51d7571f23f99ed334d8bc8360a1cdc624e5dd86fd67f788b30"

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
