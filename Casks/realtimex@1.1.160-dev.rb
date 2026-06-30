cask "realtimex@1.1.160-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.160-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a461a58c6b8eb4aac0823b67668915976806a16598de75fe913ee9a4fdc4226c",
         intel: "5bfda688248803e7d3e291d8d622a86087c31bc3810bb66ea7fd3571184f4cc2"

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
