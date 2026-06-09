cask "realtimex@1.1.58-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.58-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a95068c70a7bc73beb8af9f2177e40ae1b72f0e14f1022e22b90483341833428",
         intel: "97b6ad0447d74f510ceb754de123226818852b51efd7b35e258785e6ab4cae0d"

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
