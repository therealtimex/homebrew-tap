cask "realtimex@1.2.152-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.152-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4e03217251a3a4572f36b7f84aed13b5101a34831a60c331f46e03c9f3aca31e",
         intel: "4060bb0e339716b787ccc1fd6e4bf86463eed498bb4a858fa365d8abf56f17cf"

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
