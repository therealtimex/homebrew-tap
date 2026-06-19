cask "realtimex@1.1.113-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.113-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "950caa783383d895076854536ebd382ec535279e7433de286af3787972cd7e43",
         intel: "8911fe93c54f7195d46f46aeff7056fb94dfd66de71033ea053d6a5a0ffc3526"

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
