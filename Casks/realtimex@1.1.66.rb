cask "realtimex@1.1.66" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.66"

  # Provide both SHA256 hashes
  sha256 arm:   "0419fbe9b9b002834828028802e16582737ced4ec60c6b471400fdb32a3869e9",
         intel: "8beb3f41f54bf829374754f81ef7e718bc996a47667a0ed44d54709d324d3175"

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
