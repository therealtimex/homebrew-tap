cask "realtimex@1.1.359-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.359-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9d8a778ed6e5f90fdeef0438abea9fda8c2df481441f7d567de4a36392e4e3bb",
         intel: "5da230cd91c447af2e4aa1c33330bdaf73a775b98e6003b58e58aca9846eccc3"

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
