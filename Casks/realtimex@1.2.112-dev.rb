cask "realtimex@1.2.112-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.112-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a93d692aa6dedbb4e61e07a8763cf75225a5bbf044468cc1a6eeee758c96f1a3",
         intel: "d6702d98e544cb41142d458b552135393004ff6488d50e34e75121d1259d31cc"

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
