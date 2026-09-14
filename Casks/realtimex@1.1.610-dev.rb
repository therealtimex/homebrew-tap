cask "realtimex@1.1.610-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.610-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2dc5b21f6ba389cbf5b648206488e0712a5104dbfbcea86792d60d47da2cfb87",
         intel: "fc9331cd9f36147801d9104eaa582201b939587d1cd55a3da3999f67f0578a41"

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
