cask "realtimex@1.2.131-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.131-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8fadb2b56d7a9665732165c8f50f06db53cf65a0fb6d3205568e96a5cf9d1e00",
         intel: "b6ee8434bcdca50a6193f33a71c32b513e3eca08d8559c0d3b461d13efc213aa"

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
