cask "realtimex@1.0.128-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.128-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c5b8db33ac35c08969bbc93105971f48d2deb8a943f03faff03242e81592e603",
         intel: "347ae82db8ed32ed39e0dac31e97384947f858af06d53d3cb0c27e67e4a3d076"

  # Use the #{arch} variable in your URL
  url "https://github.com/therealtimex/realtimex/releases/download/v#{version}/RealTimeX.AI-#{version}#{arch}.dmg"

  name "RealTimeX"
  desc "Find powerful AI Agents for RealTimeX"
  homepage "https://realtimex.ai/"

  depends_on formula: "redis"
  app "RealTimeX.AI.app"

  preflight do
    system_command "/usr/bin/osascript",
                   args: ["-e", 'tell application "RealTimeX.AI" to quit']
  end

  caveats <<~EOS
    RealTimeX.AI will be placed in Applications.
  EOS
end
