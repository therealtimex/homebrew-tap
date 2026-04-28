cask "realtimex@1.0.157-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.157-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "878080da0de0fe3eb02055a09819c79f224b0abb68479520538d3a6f17d877e7",
         intel: "6fad19ad0607ccc78ada6887b5a1bf4743c921324f4c5eb7a817f0c80c94b804"

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
