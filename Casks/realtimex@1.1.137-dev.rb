cask "realtimex@1.1.137-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.137-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a8d6e3c4efe081bd075b24babf9a3341db01af1776f759a6ed07868d36c8b349",
         intel: "81c2573e3692116ee270f5a0300a1a30819e03d8bd2db1679cd8931627efa0ef"

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
