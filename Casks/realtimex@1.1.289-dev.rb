cask "realtimex@1.1.289-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.289-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e26f5e9fa920100a844b72841fe30d2b5b6b3809d4464ef139e5fcdf101ca1eb",
         intel: "7e2269e5a089089aef85c1085fb8f14e8ed94ac6d6f9210d1d40d36297d4de27"

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
