cask "realtimex@1.1.209-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.209-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "fe00a21f0b1884477692d61181a2c9d19eb4ca1fec660fe2997b03509c69ee36",
         intel: "bbe06e10f2b00e6f5a9dc451819b58bd974fb611b9eaa561a0a95e0126833630"

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
