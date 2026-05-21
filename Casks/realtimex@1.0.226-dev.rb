cask "realtimex@1.0.226-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.226-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "65cd03af698e1ce74d99f65a4adceeaea761664d7954fae2f5b256c070cc2521",
         intel: "0f9bf01fb056c2bc6662db653a5f5b1dfaca9910b697bad8522dec13e3d4efe9"

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
