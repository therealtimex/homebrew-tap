cask "realtimex@1.1.408-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.408-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "62662bf85fdc06c4e200bfb42d06c4f3eadaaad758990f886010ca4e21ee5f7a",
         intel: "a46ee92f9dfd0aa716a23920e9b53201420c1e875596ef6fa6141e59ef03f333"

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
