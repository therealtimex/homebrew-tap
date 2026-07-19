cask "realtimex@1.1.304-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.304-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "afe982a64f74c565caa4855712c7f179e2745f0bb342ab86b0f0c447dcef8203",
         intel: "ca1794080d638b9c7302eeb77efdac66a98b0503e113379df0a117791f8e0ee3"

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
