cask "realtimex@1.2.64-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.64-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5075e601b3ea03546b6c8a3bccdbbe6e35f2978147f84282e6a875f0abf44db3",
         intel: "dcfed67a042ca1a4e3837aab085712a32eb5f0be8d83d5e838bf5124e5b64c7f"

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
