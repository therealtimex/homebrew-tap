cask "realtimex@1.1.506-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.506-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2eb65db2c1e68c244424aa7fae240f012d8d58c4ab8eb0f78658f0b7d3801abd",
         intel: "77c6633fea99cfd16ec0b0fa740553c406c55ac4d20e8f440f07cc081d37dec6"

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
