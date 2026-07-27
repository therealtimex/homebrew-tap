cask "realtimex@1.1.361-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.361-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "730dab4f723f38658443e5a183a48e8389f0758292238013f2b44fe9a867fdff",
         intel: "64e56620734f23583facebe16c0c2e98050061cba6f7949650097e771e0ddd39"

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
