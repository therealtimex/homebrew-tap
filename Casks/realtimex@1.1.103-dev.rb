cask "realtimex@1.1.103-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.103-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "86a9fe5bc39519c02c7a1a4a2907167c8fd166af59e69b5f672f47cbe2c07400",
         intel: "0d6ac887becfbf32609d6ace61a59a12c67c374520f79ce539ad2ab921b4e1e4"

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
