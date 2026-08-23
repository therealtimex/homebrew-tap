cask "realtimex@1.1.530-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.530-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6bdda3c4dc65bdc74b99fe68ee4eb91d4efb3e3092e48e4f101fbb4482d531cc",
         intel: "a2196b50ceacfef0b3a780b4c8188c2b5cb1fd59c3610fa417be92490ec1fd63"

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
