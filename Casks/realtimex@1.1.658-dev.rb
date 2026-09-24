cask "realtimex@1.1.658-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.658-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "091c8531b5ea28622499aefbf3de64f65eae891d5aa5b3c563057c806f81e5ff",
         intel: "db11913ae7fe58fe9e41f48e5c53297b9c85c3b376708663957d2d697e7e0a8f"

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
