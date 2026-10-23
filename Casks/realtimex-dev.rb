cask "realtimex-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.102-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "df296a04738f5e4447c6d6642e4ee4e63c627ebad7db7244857c82123d1a4bfb",
         intel: "913beaf9f2a9dc49987081686476ef3affe5dc0e0088f5195862ce2e7ac5f8d7"

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
