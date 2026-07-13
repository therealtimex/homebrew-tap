cask "realtimex@1.1.228-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.228-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "97036b934f8edf88dd3d4e2b4608daaab45a692f7ecf3c5d8c8dd897b2bb6ada",
         intel: "038475087cd125c449d3320d4d9ab6832f9c5a55c158a0f3932c7c2bd5175df3"

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
