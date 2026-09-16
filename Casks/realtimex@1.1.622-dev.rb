cask "realtimex@1.1.622-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.622-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3860ce4f18ab0ea3d2a455c35c0551810f70684fc68909118e03834de0d31ee3",
         intel: "56a7053a8332d7473d8218a045dd389cbac62c6aaf0c092b989aa00bb7e546c5"

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
