cask "realtimex@1.1.451-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.451-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5013e5bb0ab28ee2b175fa7db6f3e7443620b94a69e20e9c1ebd685ff8b1b61f",
         intel: "48112040ae8da3f189c99a1a2054b0f33543f3e8cb2ae22b799da40766ede71c"

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
