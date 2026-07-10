cask "realtimex@1.1.224-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.224-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c9d08010bbb0bf0b31c293cc1f5aefc8b9191d4f4ed44746926f3aff6c31c48a",
         intel: "8ecdea8d0fa20e5aa40af0e0e5a4f61d05d57fbfe796ea89a4343e083f5b65e8"

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
