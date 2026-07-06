cask "realtimex@1.1.193-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.193-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "53355179bc35ff3eb949a4dd7f0422cd809c64507539745465db21130688d551",
         intel: "098ce326c52a00f9f18b128dc357b92b3462ba4756c97d401ae457137cc095cc"

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
