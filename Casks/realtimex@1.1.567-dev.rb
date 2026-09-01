cask "realtimex@1.1.567-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.567-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ee92a9682ab745f01263f1f79383860fd548f7fcb7a13f6b9cde8df7b219540f",
         intel: "5b16db999472d5fca22b1e8404663797eed447dedfeca98d5cc22feda3f797e5"

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
