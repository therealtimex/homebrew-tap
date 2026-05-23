cask "realtimex@1.0.227-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.227-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6b4fb4a6f75998f1ad0d6cb27e8836762ee23aab3cfa958f714b51912b0ff2ec",
         intel: "bdce80925c4257991076c072b8c2421237761479dc164f4daf0bbd73f34d0123"

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
