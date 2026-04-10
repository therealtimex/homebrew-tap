cask "realtimex@1.0.124-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.124-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5d6ae4a780aab7c10a0b36c70be125513ccd4f24ab9fa48ca68f939b62d11a0d",
         intel: "d7ab8d9b2708fecfccaa9aea6eed94f89b8eedcea27baa178dbbf5646abfd01e"

  # Use the #{arch} variable in your URL
  url "https://github.com/therealtimex/realtimex/releases/download/v#{version}/RealTimeX.AI-#{version}#{arch}.dmg"

  name "RealTimeX"
  desc "Find powerful AI Agents for RealTimeX"
  homepage "https://realtimex.ai/"

  depends_on formula: "redis"
  app "RealTimeX.AI.app"

  preflight do
    system_command "/usr/bin/osascript",
                   args: ["-e", 'tell application "RealTimeX.AI" to quit'],
    sleep 2
  end

  caveats <<~EOS
    RealTimeX.AI will be placed in Applications.
  EOS
end
