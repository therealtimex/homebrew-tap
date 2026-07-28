cask "realtimex@1.1.378-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.378-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4baed1d19bf508a69b10fe35693e355d0fe597097f64773311a297729a54ed74",
         intel: "a9786f07b5e891cef46a193c49de898b8628336aa74162082adfb0fab2697f5a"

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
