cask "realtimex@1.1.427-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.427-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a70e1c7b851505c6db63ddf2bbfd85451f06c9e74218e05f90d1f97b351352e2",
         intel: "31767f4d561ef5c93c6259c1ff3ccd9e0f1d672f435af4cb4005b9b19fbdb551"

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
