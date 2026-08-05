cask "realtimex@1.1.438-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.438-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "cdbc33aa8984c6fef2f63419cebd0b1f74f4f483fae41e75088181f92f37d3b8",
         intel: "f62f08de0e9deea63d151b62b7be0219e5185e9abd08cfa6f5f6a2e0f76e47ed"

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
