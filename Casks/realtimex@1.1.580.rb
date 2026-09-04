cask "realtimex@1.1.580" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.580"

  # Provide both SHA256 hashes
  sha256 arm:   "f4ef01e91283d9170324f06eaf59d112a5d1a9ced31b043bd1d34df5207a9636",
         intel: "5f19665717284df66169f2e4cb296528eb8f6c6d774de2c3ef1e802b9c134fc6"

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
