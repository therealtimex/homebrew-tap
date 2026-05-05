cask "realtimex@1.0.179-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.179-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7cd1205e95353b14c2e7b2544b533b42083704b77f6291f75e32df77e7b4bbe3",
         intel: "dfc539a5872adf9d6c70e4ca0eb7fbe5d505f1bb659124d05861eeb74d17a04c"

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
