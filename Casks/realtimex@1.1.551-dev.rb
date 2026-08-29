cask "realtimex@1.1.551-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.551-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b50bc90b164eee87f54b79c5ba5d2ac7410eae16f45d87d9834d99c873bf3559",
         intel: "e30d6b796e10d8496baec4994babf59ff7f4df4d404a89eeb6845e89432a160a"

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
