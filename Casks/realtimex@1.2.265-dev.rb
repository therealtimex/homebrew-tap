cask "realtimex@1.2.265-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.265-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "04e863cea5d83fd79fd92eb18339956d4b81de14813cec2962f20d44e09fc708",
         intel: "ad1544a97a6458a59a042f4d06b7c44b139e72a648db3436263c9245955e6d4d"

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
