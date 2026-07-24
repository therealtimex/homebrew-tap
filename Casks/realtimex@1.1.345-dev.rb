cask "realtimex@1.1.345-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.345-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c3d3af12cf4ca16522e13d72a2ed04091d3ae08e2f4eb36194adcb4d3e77add9",
         intel: "f23c6c692e2bc417c9bbea152d4b38bf03a6e36277a771b37dcf23bcf1e2ba17"

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
