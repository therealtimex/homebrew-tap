cask "realtimex@1.2.282-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.282-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4fbb48ed5f86ab957bdd2469bae6a3e9386aa106ab634bb5bcecde00534bf6f8",
         intel: "878031b5588bb892b06f8df3c9a235470db59fca57f8f96e5837f2a2435db5eb"

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
