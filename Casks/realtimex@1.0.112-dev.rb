cask "realtimex@1.0.112-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.112-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "95e7ad03a951e6e0a7af2f19a93012429be146249ca7e34da24dd1066ed0aa3d",
         intel: "a36aae20a88054050f76532e225873ec9711f70a7f3cb4038aca9da9bb3ac8fe"

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
