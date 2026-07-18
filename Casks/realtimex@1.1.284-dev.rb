cask "realtimex@1.1.284-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.284-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ab041770861bdaea64ca09817d41c4eeaf0a2ea2976332ac5a8a4efd3b848446",
         intel: "374b51aec5b01d92b2d8d25b1c7aa2f63995b2fc243cde71b88872374b2b2447"

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
