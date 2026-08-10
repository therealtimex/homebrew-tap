cask "realtimex@1.1.474-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.474-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "661f74e74f26c4703802babc6790a0dfdc43e73528e777af1bb4449a9c105a75",
         intel: "de3839dd7fc5631ecbc08368da164be41b68a8b4359ff7d181453fbe6dba3557"

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
