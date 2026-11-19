cask "realtimex@1.2.266-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.266-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "bc0ed88888b5b3e566fd1ec3a10e7b3ffbde76b18884311874003cbddade9b59",
         intel: "23db56d8376ee4bbc0cf3a87316e608411ec0ac6fb464a8e7f29101f32ab81f5"

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
