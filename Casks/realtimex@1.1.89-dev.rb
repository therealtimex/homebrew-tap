cask "realtimex@1.1.89-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.89-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "22eb90861df5379e0e163312f54c5e03d53b086073667f78a60513d123cc570c",
         intel: "82a2bfe58a821cf31e40bbe7427558a7a65f0bf4be7e3303a1cce79e8062e282"

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
