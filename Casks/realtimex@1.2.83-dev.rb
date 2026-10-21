cask "realtimex@1.2.83-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.83-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b6d8960fe1f4a95db53e7bd1aa7b5f6a389f09917301de13bcd0ae1033381864",
         intel: "b20198f7f92c132a2a1dd7ac53c0c7e4c24f074e0f1cfe1235bebd7a2c62a380"

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
