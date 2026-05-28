cask "realtimex@1.0.245-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.245-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "872364c6d58c8e6a1b3621e9fe84b5c6c12987038546dcd70a7978664e2c3c02",
         intel: "6fd6e8afe516a86309b4e7f8f953b0d71a286783ec2ff70cb87a3cb322508401"

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
