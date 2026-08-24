cask "realtimex@1.1.533-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.533-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a57464a0f1abf5dc451fafc4ba05e7662161a20bf7790088742459ecd94fccbd",
         intel: "d2f6ea037f4fd2f04a80a0cb1bea338f28febfd2c8538b28e9423be18a022cab"

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
