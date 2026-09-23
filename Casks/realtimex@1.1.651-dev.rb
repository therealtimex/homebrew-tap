cask "realtimex@1.1.651-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.651-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a56322e614624d758c5d8d099a63ae91f2af156a26fc3336d9dce25212f7ce4c",
         intel: "ea740ccfd0334483ca6fe21e5bfc3c3aeaf67e62da73c2b4691f3862a99a41e9"

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
