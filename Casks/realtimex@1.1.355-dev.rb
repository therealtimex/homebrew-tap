cask "realtimex@1.1.355-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.355-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "fe2584548746aaf63bfec8c89a98956c5164d894d561e8cc736cd1046e3207c9",
         intel: "2e0f4cc9edb6d493862e7134535f208c676504ab2ea857c6f6a9355114fa2e0b"

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
