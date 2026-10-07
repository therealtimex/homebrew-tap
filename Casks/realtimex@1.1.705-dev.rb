cask "realtimex@1.1.705-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.705-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e3279a7be38f911f8e6bec0878161ce3db4f15217d89cd04fd836ad7ca3750a7",
         intel: "ea13b18af22e9f88bb27dcd734d46c950af08a7263de1ab0273c88909f0687c6"

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
