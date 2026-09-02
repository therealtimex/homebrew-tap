cask "realtimex@1.1.570-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.570-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "41256529fd65306bc3a63040fa12bce53fcecda27d671ca0a778f99b4219b89e",
         intel: "39b40e03995814a45153fe8bf2c8ab26e5de4fbac35465e765f0561dccb9db19"

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
