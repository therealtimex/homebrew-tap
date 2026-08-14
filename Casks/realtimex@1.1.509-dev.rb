cask "realtimex@1.1.509-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.509-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5e887223ab216ee0aebf39f7d5d2125b365e49ebb4ac4292ab7262ddfb49134b",
         intel: "aa36905ee1d315f7d3a642b2b7b221f9fd0adbf806d8bc8e40251f588176bb16"

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
