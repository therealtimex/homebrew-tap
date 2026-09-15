cask "realtimex@1.1.618-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.618-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1adcc61c112eb6017f72907b3f061e7561eead9f275424fba836c45ab106fdd3",
         intel: "9649d960e91bf58afd2ab837aa1fd03d564813d58274d7ca27925efe71cd02ee"

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
