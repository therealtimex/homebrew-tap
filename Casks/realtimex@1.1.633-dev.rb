cask "realtimex@1.1.633-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.633-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f4e7d97379332e615f55a347f3b92fbaaff2597c3c4a83a718f420a5d629f84a",
         intel: "4c7836bd23bc5dc8987dd8bff49e26e7c452efbe9c564a9da773343399917bd1"

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
