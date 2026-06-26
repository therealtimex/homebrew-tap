cask "realtimex@1.1.146-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.146-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "59b0a7bc3de9cc410021fa541fda314b74095f97bca7ab393db2e22de12dfbc3",
         intel: "07795aaf820c239ac1f0f30637c1bf5fe5d87d1ae7835313a0e526d2d8a13499"

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
