cask "realtimex@1.1.354-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.354-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "cfe0e45caa8561f131b70699f4fa15766b9fc3a51d463da00256fcbe435b5faa",
         intel: "a6487283aa06cecba1eb65ad8946ed760fa3d87709ec54b6ed33eea72384379f"

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
