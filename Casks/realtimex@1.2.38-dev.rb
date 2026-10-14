cask "realtimex@1.2.38-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.38-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9a4c807099b6283c38b041b0c4e71c09f6952a0da5786563cf8f2fa7ebdb83e8",
         intel: "2927b057bcd93ac1d32658ffc372be4d2cbf35312c4a1e3ad8ad02b25b23dbb0"

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
