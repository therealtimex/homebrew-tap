cask "realtimex@1.2.174-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.174-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7c005f4011f69600076709a51872a9ac7e9c580b889540b2b6e7bd22645b6c41",
         intel: "f6563cf8fe4177f206f82d237246d530ef124874c3e021dc99307ab8c430ebee"

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
