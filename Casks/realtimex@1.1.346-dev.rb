cask "realtimex@1.1.346-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.346-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ed21802e77533b1ba2e9f87b5281289a5daf98a4535dc6a92bab9fba092428be",
         intel: "47ff0182c9c993f2a6129280ae2977a52e3be743718f7b65d744914b0a501dbc"

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
