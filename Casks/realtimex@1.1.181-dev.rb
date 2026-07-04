cask "realtimex@1.1.181-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.181-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ccaf9a0453e5b0ac4f1fac4a80fea65664620fb1ed26d973efe16f94737203ed",
         intel: "23befe5a254055447852d85cac2c43e4777a3b9d50c3a5985db23be71706dd04"

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
