cask "realtimex@1.1.470" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.470"

  # Provide both SHA256 hashes
  sha256 arm:   "8d11013d16bee87412e7fd9743da05b2fdc701cc3787cf72cd14e788a22e8a14",
         intel: "4586ada57f362c3686eb13f10c50e3dda753956973a07864158b4831d3b76e9e"

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
