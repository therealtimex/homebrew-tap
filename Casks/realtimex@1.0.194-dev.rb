cask "realtimex@1.0.194-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.194-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9297b5a83a204df57b832833e693af8e7cd63e984d80f2e70112daa1f7429d81",
         intel: "9d6a68daff8944d7a1da6f13aa388dd8c9814e4ed8f3b5ed8f37b1fd81677496"

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
