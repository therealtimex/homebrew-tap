cask "realtimex@1.2.40" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.40"

  # Provide both SHA256 hashes
  sha256 arm:   "c70b74a2bb0c42828174a9e0f779bba3c64a9366c8eeebc7eea24c864cceaa36",
         intel: "1a2a856847925e81286aa5e0a8f4b25428a4f798afdb6a9ccfb99b3b4b220ba4"

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
