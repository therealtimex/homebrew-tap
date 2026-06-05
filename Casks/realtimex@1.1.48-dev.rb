cask "realtimex@1.1.48-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.48-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "85981089a730fa3cbfe671c1f6df64229d67e7d93d467d9cfc68ef4f3fd12df7",
         intel: "7ab6fe2592e7086f52909363d6e71279b82a3a69152a0691a7e0645b1fdba6e0"

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
