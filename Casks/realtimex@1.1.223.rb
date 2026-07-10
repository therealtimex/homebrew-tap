cask "realtimex@1.1.223" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.223"

  # Provide both SHA256 hashes
  sha256 arm:   "0fa89c55ce161c18b684c5c64aa99d82351c489c8a80ee4b95f9e63f52a61ef8",
         intel: "70b9e76fe51a49c92a00bc3673b088cd914e79531e909daa57b6ae93ec4921cf"

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
