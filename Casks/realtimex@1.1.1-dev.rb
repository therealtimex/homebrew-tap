cask "realtimex@1.1.1-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.1-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3690cc60eb2181db07460987e0666cd64b6ccef1426adc47497095c3313bacf3",
         intel: "2175b466c3e386db33da8237fba2c249a9f2c9b6051e23e78f3ecb9509baeb12"

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
