cask "realtimex@1.1.348-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.348-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a40af522e7ac8d382e5c9a773c21de2f2d769ae85984d5ee72de3cf58c26cf30",
         intel: "b2fbdcdbf537ba026e6dfedac37af6138f5773799f916dd615094165ef5c483d"

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
