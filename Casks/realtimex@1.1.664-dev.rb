cask "realtimex@1.1.664-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.664-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f8c968a7953022e4bef375f36ca8f7b4bf92109ca9e1a2810ce98220a31476de",
         intel: "9572a583bbacc603a689017b55d6f2ac8341f2dfcbb2fb427dc727e3b9f96263"

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
