cask "realtimex@1.1.690-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.690-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b72b26c2bb3a4676dc2c3195588eea4323558aef8adbc71659a901991bb12d6e",
         intel: "df164301bae9dcfc423209e0b7c95bb7f150a68d1dbc6a7d96b2b9ef69f27368"

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
