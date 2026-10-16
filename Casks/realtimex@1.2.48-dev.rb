cask "realtimex@1.2.48-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.48-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "839ce8ff5fb36e13b6d801becabd8bf14aec040c8380376f58d40ca528eb6b81",
         intel: "0e3d24057fa4861c965012fdede3eaecc62dbded56fdd8f5dbe052c82ae0ba95"

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
