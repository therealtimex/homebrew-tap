cask "realtimex@1.1.491-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.491-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3193aa6550f973851443723bd6f411c6bae9a94cbd286474c5b2bab5522b1a7e",
         intel: "579d5a8236141424c013292ec11558449472733e77865a799cd1b977774756e5"

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
