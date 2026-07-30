cask "realtimex@1.1.388-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.388-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "81361cdd42af895bbcfef63d68fb4ba757943463ee41b35314512265585a33f9",
         intel: "3abe7d113c35aa2c4790f651b9c28d659ac3926db0de64e617ff15953d17b3ad"

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
