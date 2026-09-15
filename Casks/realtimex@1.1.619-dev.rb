cask "realtimex@1.1.619-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.619-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "003de598920363fbb5a1bfbf07cb8d90fc2e8320e248523702fe1b5a302e2e4b",
         intel: "df040bff2984776d0d069d2e6c2f8e0cb7849434fdf0cc3a66120d73e0dcd364"

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
