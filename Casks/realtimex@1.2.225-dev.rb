cask "realtimex@1.2.225-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.225-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7898a54adfbb6dfab944761d0642e99e6c39e6f03f779056e7187955c01125ec",
         intel: "eaee6edc74e64d9525386f8a8dd7a78c2b9f3c192c447ef35b8eba57833ca47a"

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
