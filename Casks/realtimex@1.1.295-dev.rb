cask "realtimex@1.1.295-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.295-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ca833144219ea86c3724c12bb239cdfe26551cfe8b31fc0a20e1e1720c97b033",
         intel: "d1650a142dccdd2d055260744f0367fc5f45fd439e42a8f5a6ce50270e075d99"

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
