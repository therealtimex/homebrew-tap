cask "realtimex@1.1.446-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.446-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3297af478d155ac98c8225842d4be96f6bf00fc075b357dcf089a20722b3bb91",
         intel: "c693c77d97cefc1fd0dd65656ca9db705940544e6d7c2bd29e294c44f59cdf54"

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
