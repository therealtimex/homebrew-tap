cask "realtimex@1.2.120-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.120-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "66d8c76786b9b4a0cd1ce9e085ca00ba923327cc7dc7b219624c989297b82ece",
         intel: "62f4bb366b590203947eb5373f09c5f31baf784216ff2f581938ff4881e8d78c"

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
