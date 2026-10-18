cask "realtimex@1.2.55-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.55-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "423ddcca50cbde21c3faeb700ac4afe1e3ddc974b06968888ed11e85e49b4510",
         intel: "73e1e1da33da0dd03bd82bd0d07d3895d719dec6d6cb5b89c5fe82ab5d873e70"

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
