cask "realtimex@1.1.577-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.577-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4ab6d9fbcce71804e8406976d130a05d02238286ba5655b30a52ee4dd1e444e8",
         intel: "e135f103edab14e8f7e3a209801612e14d6d527b7ec68488a3f4cdeee907d462"

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
