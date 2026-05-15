cask "realtimex@1.0.210-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.210-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ef4ef99a8f368f84e4edb14592607e8afb7f99188baf213037ccb1cd452a69eb",
         intel: "b7556640b17ad4fba976f134ff4d6ecdedca68cc3012b02afed92739d53cb9e0"

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
