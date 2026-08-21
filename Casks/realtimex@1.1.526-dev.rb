cask "realtimex@1.1.526-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.526-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "afc373f88a5fee153159cd33dbc1a784bd9bd64df339a93a29e40b43ded92130",
         intel: "e338bd075233ecd6e819960774870ba7707bccca40a5418f751e4aae4a02bbe3"

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
