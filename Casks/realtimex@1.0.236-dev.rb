cask "realtimex@1.0.236-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.236-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3e64327a617978b309a389cb39daf61be8b561b6ba06fd2dc0e911f722abfe9a",
         intel: "3478094eff8eb147a7cd59cb0a1de752ed77aa90c3e79f4eb6e9ca055fb123ac"

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
