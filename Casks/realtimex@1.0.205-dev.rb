cask "realtimex@1.0.205-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.205-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3c4f26229e9eeef2ff9b053a685333cc2759d9f8e03deb235a9c613f732a1401",
         intel: "4d27677c0a5e9563ec7c6b8ba325f0d34a6ee9125b2c4585e15372b1105b942c"

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
