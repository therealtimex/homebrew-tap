cask "realtimex@1.1.219-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.219-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "204c5592104a11aab349f1ac9b87151bcefd59af8c4c7e0134f89b57b29e59af",
         intel: "ba8ec4d4f1ef8e37b67644fa0ec45643943b482052dc059e0adf9e1bb85187fd"

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
