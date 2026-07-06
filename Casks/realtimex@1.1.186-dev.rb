cask "realtimex@1.1.186-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.186-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a383da8d9d36be794241a58ea878c3910cc250174c9383274b1169c0890f1d50",
         intel: "b1521830113604d3a462af28b0b6cac3ade3df1b7dcc6cd9f2e68e847d7fc9df"

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
