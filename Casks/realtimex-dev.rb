cask "realtimex-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.59-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1bcf1eb53d5adcfcb2c7461d2b02b507e57362112b6081a8ff9c94ca445bfed9",
         intel: "d9f7e73f833abb8f4bcd4c37b3baefa8ae4cc0466a7584674c57adf11ef85d6f"

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
