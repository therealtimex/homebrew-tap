cask "realtimex@1.1.480-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.480-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "20ffedb0ab55f9b01e3093358d449b1e84b289fd5662d596ac5863a3b125bca4",
         intel: "5539819251064a4552ebaa7df746fd4d21442de10e6dea218beeb52b52a51f3e"

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
