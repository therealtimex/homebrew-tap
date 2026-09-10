cask "realtimex@1.1.597-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.597-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "56de9a174f6bad8b54d3a8e1f05a4bad146149e9e9fcd5c85b6d2d8406ae2540",
         intel: "8532a150f0a1a5fcb400506ebaee4a083b6397625e31c7057b0dedb88324969e"

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
