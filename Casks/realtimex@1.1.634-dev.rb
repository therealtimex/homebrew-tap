cask "realtimex@1.1.634-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.634-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "800cbd05aa4583b4e06666b290024e5764a3dd2fac4c9fe28304f7313a1371d8",
         intel: "d288951006da14a6a061592a8cf3c250bbf582c508a910466a7e4346db652b67"

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
