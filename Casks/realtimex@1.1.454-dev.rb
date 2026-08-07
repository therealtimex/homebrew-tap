cask "realtimex@1.1.454-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.454-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "dbe226298c6aab6335b83aba71a5e524dd678f0f8b31e116fa0c88da9d3f02d5",
         intel: "3f706e0c65a5701714e1782a84fbde9893b6225327f9087cbe1101e177a3fb04"

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
