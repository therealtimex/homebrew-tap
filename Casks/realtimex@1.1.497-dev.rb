cask "realtimex@1.1.497-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.497-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ede16b27ef99b7458666136ae0cb9f3827e6bfdd61860c0e76396e4f3149c129",
         intel: "16d567878c97a6b05d21bb2b6fa2065328e11e17805bdaad1cfc783c2112eca5"

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
