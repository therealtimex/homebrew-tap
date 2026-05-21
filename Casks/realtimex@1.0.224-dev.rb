cask "realtimex@1.0.224-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.224-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "001451537bba124cd47c6bad09902c3e122655296efa62f4b5bab3697302cf17",
         intel: "3899ec2ce25b8b15836b53799538916cea237e1382ec0a1b5bc312b8445f413b"

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
