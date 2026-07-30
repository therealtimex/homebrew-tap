cask "realtimex@1.1.394-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.394-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "82c21e5537f4acd1d67177afabb8b2be234ca6e517582caa55367d5a8c8ff20b",
         intel: "26b6669943dcb5d1a587440e6a1d25db04a1b1b880427eac12ad592d607ce2fc"

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
