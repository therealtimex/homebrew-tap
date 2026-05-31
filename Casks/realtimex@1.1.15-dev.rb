cask "realtimex@1.1.15-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.15-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3dd1ed766eefad95b90ae1a16db344f5952eab4849cb49be04d57efea7af7f0f",
         intel: "e9889484e3e88c61830ec26aec5b025d50d9ff496fdc5f5ca92e77758299f41e"

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
