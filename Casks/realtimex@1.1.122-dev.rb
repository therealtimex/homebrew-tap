cask "realtimex@1.1.122-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.122-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "71ce32fdd5ed837ec0ffecf5997769eddb3b47f91fe828164aad2695aa842feb",
         intel: "0035381f98fb546bc669926a2aea42366cc92192ab0e01353676c41cd85cc3fc"

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
