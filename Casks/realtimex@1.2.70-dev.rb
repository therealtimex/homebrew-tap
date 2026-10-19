cask "realtimex@1.2.70-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.70-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "866ea526b12595d2dd2cbca53b6714ff33264f56916b0c5eaa55167a5fb767d0",
         intel: "93f695054c320011e52d341f821e077b35fd151ab56a8f5109d371e7a7aa0fbd"

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
