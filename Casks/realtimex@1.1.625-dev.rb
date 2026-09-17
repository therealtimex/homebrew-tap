cask "realtimex@1.1.625-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.625-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d6d4b7fb93880d28188a832f0e52e934f6eec3af6f89f7a22dc8a190745d0f7d",
         intel: "08ba0a8cbcc427f00d4170bc4233a46a28f4607c28bb5494aaf3da7f5928a35a"

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
