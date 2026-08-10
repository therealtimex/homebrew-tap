cask "realtimex@1.1.478-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.478-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3c41d17e17746c1150ce28a71009de6fc27fc16a8172e0499966f723dd5b337f",
         intel: "8e82b16eb79e153347db5c52cca416b213ff93a6d70841958530d919b6b37540"

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
