cask "realtimex@1.2.137-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.137-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "96c43575d9cb0c0c6fe5328301a0241a481ed60c7ff7c6f1f26d996aa677d2b8",
         intel: "bbdd6981cd250b7b794a0e08cc1030f299ea2cacc8b99a81bfef7924d3e42d5e"

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
