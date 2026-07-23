cask "realtimex@1.1.340-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.340-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "045f471d287c328a98fb3f6cd30d9c77556f7f563e0eb8f68ba85026e73611bb",
         intel: "6d1113579843c5974dd84b057cec67df66e07c767c3417cfef72560f7a617b0c"

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
