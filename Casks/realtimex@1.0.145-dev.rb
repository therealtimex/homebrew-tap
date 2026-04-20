cask "realtimex@1.0.145-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.145-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "116854eaa301543b246b543e3228ba1041372d32bd172be781d61de27b3337d5",
         intel: "704afded31702d5e0e17d437ecc5bc817e42accf82ff192f872064dbe22f8ce2"

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
