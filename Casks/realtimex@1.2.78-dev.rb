cask "realtimex@1.2.78-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.78-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "fcbd423e1fab430e130a06d527dd2cb66d19a8ee015ae8e273fa036fe1869437",
         intel: "fe292e9963aa90c66ccae3596f3a67fecf9d7e00f28d3e0f19bca798784971dc"

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
