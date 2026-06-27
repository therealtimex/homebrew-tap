cask "realtimex@1.1.152-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.152-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "aaf76dc86a10a7f7c92d0f4836208f6a8583376795e424e4ed68e4fd976e1fe9",
         intel: "c457e5e32d679dc7ee8b3412935ed66645a56116ef2e66a011e10de19ea138fb"

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
