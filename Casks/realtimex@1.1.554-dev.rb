cask "realtimex@1.1.554-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.554-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ead0da73d5fb93a109debbfa8f7c408341b365df5772c68e6df1d23575c93b07",
         intel: "d49b6004b28e40a83ed43286ebf1efd1eb88f62b499c8da7d861131d605bdbaa"

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
