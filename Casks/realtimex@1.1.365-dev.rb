cask "realtimex@1.1.365-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.365-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c079d04714545678fa87d753de6c02d81fa6b4741c7a9107a5d1908c369f05ec",
         intel: "133e07c9243588bade9ead4d875a4e11cf2ab1a6d96fcd5888abcae274d615fb"

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
