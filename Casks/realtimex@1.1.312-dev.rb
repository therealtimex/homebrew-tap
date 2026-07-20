cask "realtimex@1.1.312-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.312-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9c1b5a473e39ed0dc1a604475db4671542b51b5b3e12a470ad74c3a353180353",
         intel: "1cf2f48590bb76c0d7023b2783310e34abe04e0c8184f1582222f0d5a8ba9adf"

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
