cask "realtimex@1.1.463-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.463-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3a3f6c7570a8269a1ad67c46b5bcaf14eabc1e1d64e029948559ef5dfe896809",
         intel: "16961f61d118749bf64de8b277279680e7dbe6798b3cadac88d9fe92e6a9ca4a"

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
