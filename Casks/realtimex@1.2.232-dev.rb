cask "realtimex@1.2.232-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.232-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "609ba22cb611e71e1376cc2498ad878ffbeff4d18ce94a95d869a57419f4870a",
         intel: "5f815fa9e20b5a25218c4e66bf8514938de20224c0c527192725c4a5b1bb37cc"

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
