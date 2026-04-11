cask "realtimex@1.0.133-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.133-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "437a4d58d015bba179fb44250b0a52f6e5c6ba22240d8e4e852aa535972acefd",
         intel: "9e3921856f874439a525c2dc0beaf91923d002dabc1df76bc356e65185ba5153"

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
