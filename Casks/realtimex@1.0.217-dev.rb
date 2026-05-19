cask "realtimex@1.0.217-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.217-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "fb5aa170b553835f5e4d0137b41830c7ac3fdbb55b92483f203e7501ca089370",
         intel: "0f676e4ae2f8404cf667a9a7447e8d98c01801b80eff73ffe288b99c66e9cb11"

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
