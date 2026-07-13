cask "realtimex@1.1.235-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.235-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "fe40ae2fcc7d8df4407f461f75dd9140dde04752deac3b8de6b5fd97156998cc",
         intel: "bc680c90dc1c7a7d0bf0ec2dea80864e4f8fc3fbac1857c12b317391023bf6d6"

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
