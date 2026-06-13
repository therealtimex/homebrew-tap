cask "realtimex@1.1.86-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.86-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "278cc41fc00a2bd4255e34138a1f5d2d9f122f33aeffa42012aad82f00b0f103",
         intel: "f815c1d4102d1a81feec62aecf1246e6eed8b5fd1a447a593be60f74738b0bd7"

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
