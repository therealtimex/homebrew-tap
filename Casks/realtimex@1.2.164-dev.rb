cask "realtimex@1.2.164-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.164-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3d2098afd8ba7d2a847b893eef523c2a29ea3419955958d55e385686831cdd8c",
         intel: "7be0b66ccb1f6c1c92d90b84a24ff4c5963b251108cca2ac1269aced43a6bfcb"

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
