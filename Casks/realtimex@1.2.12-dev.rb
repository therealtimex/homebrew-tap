cask "realtimex@1.2.12-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.12-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a7d31d8e42daa2bfd66644d2af8f0be229d21792a02b8fd327de116e33698af2",
         intel: "a788713cd2af26e2c08946c12c3199c9571e93b89f70872fde39f41bd9df60c2"

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
