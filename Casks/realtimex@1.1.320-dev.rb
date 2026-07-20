cask "realtimex@1.1.320-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.320-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "968d14bf1410cf73927dd2543f4839ca81991efe6f8ec336655b19f6ae3a3a38",
         intel: "cba5f9f8f2a31eb3761307e6fc6f539ae60526face294b7c1e5ddf57af4324cb"

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
