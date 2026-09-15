cask "realtimex@1.1.617-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.617-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9363fac666ee542afa0cabb9ef72efa1cadf2bfdbb8261d4801e98ff76035827",
         intel: "342cefcb737ca7252c24148cd9e4eefed7e1c55b7693f03c7a0e31f88affb9f8"

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
