cask "realtimex@1.1.301-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.301-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7f51e85aaaa29fe72836b9ee0c84721d4669ccd68b25a104ea4097fe74f9dcc8",
         intel: "6bbbc07553dda968924c9a6c5a32d7b982ea762b18df321fcb57fe7ecf18e5e6"

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
