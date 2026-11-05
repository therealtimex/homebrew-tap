cask "realtimex@1.2.206-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.206-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "bca0d329422c19729d28b09e72fd378d9b4a740e5d98e81b59a6002c0c2760b2",
         intel: "6fd602e6ea1ad4cb2228ed3e8a72fbc471db41b569068911bd93a498e1269789"

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
