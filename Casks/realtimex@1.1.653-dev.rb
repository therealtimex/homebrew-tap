cask "realtimex@1.1.653-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.653-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7fbdf76922ff3c643cfbb21d578170940a0a1990e1bcfa695af959daeb1062fa",
         intel: "983e8f8a71ad89dac9ffc7ff310ca879987c2a452d6202c33347f631bd53140e"

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
