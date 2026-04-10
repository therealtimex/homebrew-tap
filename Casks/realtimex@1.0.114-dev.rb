cask "realtimex@1.0.114-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.114-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0b14e2f99904ee4db1cc18a9c80a95adc4796f5ae3b0fd4833aaaff2f2610f63",
         intel: "519472a0778424d2363c37107433b0f784f67587a9af87bd7d3d9d1b2d39194c"

  # Use the #{arch} variable in your URL
  url "https://github.com/therealtimex/realtimex/releases/download/v#{version}/RealTimeX.AI-#{version}#{arch}.dmg"

  name "RealTimeX"
  desc "Find powerful AI Agents for RealTimeX"
  homepage "https://realtimex.ai/"

  depends_on formula: "redis"
  app "RealTimeX.AI.app"

  preflight do
    system_command "/usr/bin/osascript",
                   args: ["-e", 'tell application "RealTimeX.AI" to quit'],
                   run_as_administrator: false
    sleep 2
  end

  caveats <<~EOS
    RealTimeX.AI will be placed in Applications.
  EOS
end
