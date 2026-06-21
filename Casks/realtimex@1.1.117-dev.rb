cask "realtimex@1.1.117-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.117-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "26c81b55ea1e65c38a1561be6e06bf08abdd06065b4eab5c22662db3e5da8482",
         intel: "6133cfd2f666f1e202567ab22b5d8068303ca0866ae8ead4ed4ae3c484a25ba8"

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
