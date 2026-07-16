cask "realtimex@1.1.253-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.253-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9bac154635dc3d66e0f9193e00a10a5d6c1165f8e2d1e018e7e538fac1e6b9ab",
         intel: "48133fa0336fc1e36dc528110461724a813eb4e25825a68afe9b896a34357d99"

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
