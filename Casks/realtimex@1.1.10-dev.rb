cask "realtimex@1.1.10-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.10-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "dc30f9755815f9837ef4b9d0a6c77ae7be0dbcce93bf85410a91f4ce78cdfba5",
         intel: "164376b273f02f2bdebf36915c322d03781f20889683dda016201cf862502623"

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
