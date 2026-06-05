cask "realtimex@1.1.47-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.47-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7a7b6255c5878650bec248e31e4b8fe65a919cb64169cd8cd094c7c2796459ba",
         intel: "62b8112fb883b30dcb476835eafba567864fb9bf01b540118c673d56ec2d2cbd"

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
