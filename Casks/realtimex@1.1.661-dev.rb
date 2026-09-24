cask "realtimex@1.1.661-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.661-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "60ea917440199b9ff055d4ef6899c23b09f83956dc36c8bed42e6ec34520ca51",
         intel: "d09e178cb8ad177a57c9274b7df03136db352c7b86b1e4329f332180a9c15826"

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
