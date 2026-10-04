cask "realtimex@1.1.696-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.696-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "14c35ec390d08d3cf2665e844b6a794acc7e4260bcc94d90aabc9d9724753b04",
         intel: "85002a09647a069f878148ace43fb2687a08bec8b8ab100033a26c5600be867d"

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
