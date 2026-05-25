cask "realtimex@1.0.239-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.239-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9422901e468c238a4b685b9e9655fb2706930a7e3f3aae4a52bd8662098b5bf0",
         intel: "3eac5609291ec4049936b60d5ed570c1cd5439a953eeaa9206d1d727b94c1dbf"

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
