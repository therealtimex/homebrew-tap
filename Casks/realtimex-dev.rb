cask "realtimex-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.692-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "172ea7147fb2846dbf6750e2720993c1817cf90a01fb53e3098a6f663dfd0bac",
         intel: "dbefbc46b245ebdda0a2b98814b2517aceb58b632ac705df4515dce00240f6ea"

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
