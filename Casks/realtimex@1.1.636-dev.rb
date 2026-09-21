cask "realtimex@1.1.636-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.636-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9cca2e9d46e30474dc817b92bb0cdcb35d3cd77586ed711ef18293431189d556",
         intel: "8c6656587e74912fdaa150d8b9851c6db28c4b845d5f8a1851541a9f8ea82bf6"

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
