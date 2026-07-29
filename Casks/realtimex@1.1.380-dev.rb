cask "realtimex@1.1.380-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.380-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "18ab958d4d204ca6744860fbc420a28e9d05fdcda08c15dae8c8bce9431530b8",
         intel: "c51c2a05bc37cf62d354db7b5b6405a5586b620db3a1e20201b61753545fff53"

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
