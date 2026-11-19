cask "realtimex@1.2.268-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.268-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a70f68e8962c3b24ac7de33a69a7450343dcfbdf1714532aaa9084537e0a12fe",
         intel: "ede4be20bf1a6ce4fa4d160adba3db47635fddfe0300f94d2a5deaafc0987d75"

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
