cask "realtimex@1.1.511-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.511-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d88318f9cc2edcd695b718a26b0d2563cffca9c2467d1d0e4a96384ae67901e1",
         intel: "c5d8488458e4f3fefa8ca74bb3354503e1abada1d1efdae7b525233010cfafb2"

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
