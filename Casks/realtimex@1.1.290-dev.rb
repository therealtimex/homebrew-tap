cask "realtimex@1.1.290-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.290-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "df1eab718390827b7efaa43561ece279fc09f33518ff72f8d5f87451723357ad",
         intel: "010df74cb66f0b20e1e29fd8ee541e0a0acb39edd0bcf479c545726e6a5b031e"

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
