cask "realtimex@1.1.458-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.458-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "76f7fa25b817c760c6764167e543f0464a60b5745fc66b3ba413a9c8cbab83d8",
         intel: "f6289de8f8ab530484edbed8ec3dd39d72901f47ffdf4e9a6284b2bf6ace6db2"

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
