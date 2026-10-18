cask "realtimex@1.2.61-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.61-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2e2020c33f45858ca47bab9f42aec4511cfb79747fba9a1747e795586686b78a",
         intel: "44e0176812876b570e316df62e324d1d33bf428dcd4cfaced2619a58943b0dc0"

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
