cask "realtimex@1.1.120-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.120-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b96edabf856f3e4aaae55e94db1d257440ecc7324eeafb3584bf0ec5a4540f18",
         intel: "87dd2740132321084c38da20e8ca6d233c4b8b5d7843c0b60374c0f6bc454e6d"

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
