cask "realtimex@1.1.144-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.144-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7aa4429e2ce2bf48e7982a1b1a8b51ce66e5647f0319f0dd04789f38a5ef404c",
         intel: "105f7678e9c0f9b05fa997bf982ed36cd26db1af76865c35199d986a036dfcc3"

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
