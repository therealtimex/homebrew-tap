cask "realtimex@1.1.17-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.17-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "05a50547055ac389971b4ddd425728e42bec340cb4d5abb8b8090dda550e0fe8",
         intel: "7939187900fb96e59e2822909e34ae0d68f86cff983ac0139e37be118aaf1970"

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
