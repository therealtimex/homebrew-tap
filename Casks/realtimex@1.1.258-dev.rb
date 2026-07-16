cask "realtimex@1.1.258-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.258-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0160114b39391ec3cea05a6001fed7e106e6fa9d54564b7e37bee041e29b7712",
         intel: "143a192d281b3e8070208695ea2cc2f39634880a352692515411e19ffee1d863"

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
