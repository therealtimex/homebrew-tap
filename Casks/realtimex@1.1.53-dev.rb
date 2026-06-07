cask "realtimex@1.1.53-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.53-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "18f17df1645166ef44af984a5d379308f32acc47183e482483b72beec1cda5ff",
         intel: "c31b94eb8715adc5cd86b5abb3cb631ad54fed8f94d47b99928c381907d5e3f1"

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
