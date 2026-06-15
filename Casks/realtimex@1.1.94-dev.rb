cask "realtimex@1.1.94-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.94-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b31549581fdd617e864d76a3577bcb81a933899787c54561ffe1ba921e68d33d",
         intel: "a680bf2a0dec16e09b984cecc4e39170f3d5e47f77059786174674a657a9b33a"

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
