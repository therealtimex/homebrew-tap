cask "realtimex@1.1.200-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.200-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "85f6032ce3e65174561428cf48b8373fe2081ee67b4e2a9f6a88793b56bafa6b",
         intel: "873cc6640cb480f55035dc414121bf9e5760cac73fa6daf75faad473d171644d"

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
