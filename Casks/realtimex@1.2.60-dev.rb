cask "realtimex@1.2.60-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.60-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "60b8747dab7ef877b970e843925401b74d439e572ecd6415b42c30e6e70236cc",
         intel: "a9dc8541db3a6e6f71eb046a0024f62a411d790c348e022e529d03027ec85afc"

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
