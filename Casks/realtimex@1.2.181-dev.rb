cask "realtimex@1.2.181-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.181-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2e3e04663276f2c0141a54dc8126dcf0348acaa0d822fa4cadcdddae8a442f7b",
         intel: "1d91fbcc003f6cce8874509cadd654b4d2e154fddaef8a20e66c493993381986"

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
