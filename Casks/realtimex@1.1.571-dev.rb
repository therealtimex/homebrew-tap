cask "realtimex@1.1.571-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.571-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "228605e799d55c7efbb77bbc6fe68e0cb9ca5f3586ca84b806283d7d8469aa89",
         intel: "e1e5136e608aee6c89305bbf78e699eaf42d7d8e99317a3ee52140507c8caf6e"

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
