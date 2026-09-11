cask "realtimex@1.1.600-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.600-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4de99c57d11108cd8f81d37e11e77e6c02f287d19ba52e91cca02e96106b2ed9",
         intel: "697ec2e38bb5e9478bca9df69596b3a9cbc2a04cda797af48ef71c797f6bd2fe"

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
