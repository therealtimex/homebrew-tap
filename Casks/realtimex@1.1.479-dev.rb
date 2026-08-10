cask "realtimex@1.1.479-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.479-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4a0962ceaf95b2a4d56e1a50f5cf8fbfca22e70b2060e6ee94639ef551e5b354",
         intel: "a4c986a8f077104019f2880021c21ddcfd23771465e4e5d60cb9b36090f71075"

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
