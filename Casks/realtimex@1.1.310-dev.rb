cask "realtimex@1.1.310-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.310-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "210700a6c62c91eb91e22c951a8a2dea21c6ceabd4f9037789786932f64224f7",
         intel: "79b7678be707c5ef345466450b4ee890c572ca61c452f669849e669bcea5901c"

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
