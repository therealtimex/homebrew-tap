cask "realtimex@1.1.703-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.703-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f11f3996c80cb9f84ace9ce730f90f40031d63a925aa9d4cf0285ef4c2c0e67e",
         intel: "687eefc46c0a1e921ced6ffa752856e3d42c9b67ce5efb5c250a6c80eca22997"

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
