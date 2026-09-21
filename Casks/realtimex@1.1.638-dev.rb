cask "realtimex@1.1.638-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.638-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "34fcfe464c23d85e03d3ff8cddfdcee63770e5c8a4aa74ac09af9bab2f422185",
         intel: "b2e32b2162ea159bd88e1973d8ce94842edf35f762c47dd55797e1e124487665"

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
