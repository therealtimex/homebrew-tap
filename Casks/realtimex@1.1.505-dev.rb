cask "realtimex@1.1.505-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.505-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "386a4b99e35fd2297233f176324e57b5efd32d64d7361e967d624756446990fc",
         intel: "3ece7dcf026b6720bd1b15b2d35b296b9f6d3a2f038f3dcd30d6ebb340d81506"

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
