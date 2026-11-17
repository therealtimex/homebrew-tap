cask "realtimex@1.2.252-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.252-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "50b2f3e5dae7b7311f920db215742973839ad17162612e0a75931e1cef47615f",
         intel: "0b5681753583e9cc00eb7617b542b436fa37d98c1de1cf219c1358888ddabcd4"

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
