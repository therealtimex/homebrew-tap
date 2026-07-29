cask "realtimex@1.1.382-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.382-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ca091c734655a6658efebbf85612f01a99f3840b0126b03f38b91a8e17c6aaeb",
         intel: "eb80e33d5502cfe606bbca129cdda5e28eb96da115e776f1f6ab4444a92ca6c6"

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
