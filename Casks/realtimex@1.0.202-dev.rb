cask "realtimex@1.0.202-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.202-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "030c16ac3e0a029422655c4379e4480e95d305c1102069f4f42ad946ec1978b9",
         intel: "7e6cae6dfad3473135f3a117814326d27fe4bd3c4f263e6d960106daebe2178d"

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
