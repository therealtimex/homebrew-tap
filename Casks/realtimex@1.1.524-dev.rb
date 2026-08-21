cask "realtimex@1.1.524-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.524-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c8ea62d4296489132aa103c07b0e597fa4e195e0d6a855c218db225a597355bc",
         intel: "465225e8308a1672b2b65de04c8a9e5752f9df3ccd7d94b8e06e31eef71e9e8c"

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
