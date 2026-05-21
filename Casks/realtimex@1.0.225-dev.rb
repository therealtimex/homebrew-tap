cask "realtimex@1.0.225-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.225-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "976b90ea87366fc38b307710e1ef5e37647f8d0c97e8f4da8e9c1e6d2876f557",
         intel: "4f8575bce299fa83b11a8b1ee1e861075c49303e4bec35b69fbaf3b4fe8876f7"

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
