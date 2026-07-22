cask "realtimex@1.1.334-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.334-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "df010728ce75eb0f0f593b061fc968580418398b43942a5547f7a0791276bb16",
         intel: "7f080599ca611023185aa59c8d9c88a007414cb82528f574dd1ce303f4994c13"

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
