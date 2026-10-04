cask "realtimex@1.1.695-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.695-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "878b5ce30096db71c9f147a42bb5be7b41386b5c5c9471a529fd2a4b53bd41c1",
         intel: "20066ea842aaaec82614cc344d66b371a76effc78db6ac0f2d75430d48225e48"

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
