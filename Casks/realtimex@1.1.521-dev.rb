cask "realtimex@1.1.521-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.521-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7bea0f2887981be8cc081a1e83fd8a168ce78db16b391600f31b9796c20e5e3f",
         intel: "fbf8cf1de33a4cb4836fff5ceb8d4524954d2be86d6beab243ba8396a4e91319"

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
