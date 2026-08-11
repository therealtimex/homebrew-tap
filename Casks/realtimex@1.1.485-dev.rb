cask "realtimex@1.1.485-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.485-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d1dc0807186ada407f15022b345ebc6f343334845475b7d621074d482900b035",
         intel: "17fb84a564eab0b44ad8628c5b5c0193549c9902b512ceff061703197ebb5a92"

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
