cask "realtimex@1.0.208-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.208-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d78e93c332d27fff3f39722152f9c49471fca0d4f3366f2b09d5881cbda3c0cb",
         intel: "9c91c25389b7579dcbd22e373831576cf2e30d9bbfbd6c0605f70f8322d43f16"

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
