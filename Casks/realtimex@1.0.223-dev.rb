cask "realtimex@1.0.223-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.223-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5e0b756b64d66b12c0c3f5795883acc5ddd2b218f008382776ace2874e44a4b9",
         intel: "6bcac0be6873414ac08ad650c523f37bb815e682d0e821e458072a5393e990fd"

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
