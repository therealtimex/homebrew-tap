cask "realtimex@1.1.330-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.330-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a0be340542e44efc9de04cf2dc125640ec79b0e18648544043c8a76f82483071",
         intel: "6d289d085d61cbc37245d007f22aa758a1f33797e3b8418145ff16f70b582a46"

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
