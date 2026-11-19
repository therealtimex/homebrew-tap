cask "realtimex@1.2.269-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.269-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a3b558b4170aa26d218b3d3087d267eac52caa0f4f51427090c1a0e7efef1ae1",
         intel: "45d8708c086db6e6b2c9073bc44745f06b64fdbd7c93ea955e77757dac5b83fa"

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
