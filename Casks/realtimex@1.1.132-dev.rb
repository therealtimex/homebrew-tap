cask "realtimex@1.1.132-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.132-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4d5feba23405e5d8a11f9bbcafc6c06dee80631cf02bb214dd4439724cbe2d17",
         intel: "ed793e25ef822412806691e8e2bd4c8294da1b9d24c67deec2b34363a41093d5"

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
