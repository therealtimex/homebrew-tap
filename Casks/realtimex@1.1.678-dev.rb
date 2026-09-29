cask "realtimex@1.1.678-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.678-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1fc45b33918ac65b836eb49a4312a04275b1c8dc57b0b38743a559c34cbe9070",
         intel: "bd2f943c262f36d0716f152943f49efe2055a22ebec3155a67c947f741b93a6a"

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
