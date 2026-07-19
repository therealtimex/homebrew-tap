cask "realtimex@1.1.297-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.297-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ed8fa00788d724f111517cb1ab95eb032d7d16d8bf4fa9c6769613dfad0ef967",
         intel: "f26665aca12d8db9868c524050e619c8f24e84bce0439ef69a43e22ae8b2f6a9"

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
