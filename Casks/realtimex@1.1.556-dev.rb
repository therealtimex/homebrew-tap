cask "realtimex@1.1.556-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.556-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e7eecd39fdffef70bdcb6f5195c6948189bb54d237367008274f14d0910cf4b9",
         intel: "ef5446cb60ec2a41fca1642d06347c56163d2c9023e08230cdc438fe071cdada"

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
