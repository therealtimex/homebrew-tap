cask "realtimex@1.1.697-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.697-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5446944cf05e4a0b2754de134c1893b679e4cc3404bb00bc088e870cd2447200",
         intel: "b6f20f73668b1c367c3fe010dc17df3b9fc3f80b0313f072417d5897dec95379"

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
