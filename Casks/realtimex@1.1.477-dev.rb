cask "realtimex@1.1.477-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.477-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2cd06ee3ee417b0b627f00cf875c43538673f50352ebeca9ad511caa3d45f792",
         intel: "7cff8055938b9bc09e09d3f9324caee646e79efe550ab2e05fd45b310e46fa1b"

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
