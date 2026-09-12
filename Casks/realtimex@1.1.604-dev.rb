cask "realtimex@1.1.604-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.604-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "86306c65c3659ca9a657063be7a43fb2bd660babcda6a940e6dd58fcd727c792",
         intel: "51f34518369b47cde050b553813cc70a3a61d339147b403d1ed5796e13f574ca"

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
