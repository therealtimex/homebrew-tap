cask "realtimex@1.1.660-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.660-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3e37ca4b3a1480dec1d685895fdd60e4fadd42f8671cba4e83190ad1b44c9589",
         intel: "0dbb74191c544620b1f2820836bb749814d69abbbc792f0b6d3416fbed612c98"

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
