cask "realtimex@1.1.536-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.536-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5d94ac87992ce21cfc088fe24a3741237cba08c6ebad65147804852174451e77",
         intel: "d98233b43d8d07c23df4ad91b73ee5d866d392ab513f4c32085e85db263328d5"

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
