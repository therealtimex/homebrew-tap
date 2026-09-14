cask "realtimex@1.1.611-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.611-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9be61431e966c2a38953b98d5d245d04550960213eb8dffa50d24ea9a3073b80",
         intel: "93aa90fac85f29707d2cff79bc8ed748c97bc177b63a975be1f5c21117ffcb47"

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
