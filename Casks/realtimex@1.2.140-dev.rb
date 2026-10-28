cask "realtimex@1.2.140-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.140-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2d80ee3551e1ac8b9b2f3861034c9c184dbe3baf04c0095048bdc7fe6763dc78",
         intel: "c89e22868b4f047af45d65e161ab59483e92b89cadff4c494475d7c312998608"

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
