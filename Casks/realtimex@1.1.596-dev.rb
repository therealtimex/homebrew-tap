cask "realtimex@1.1.596-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.596-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "bfbb657620be0395f48c739f7ecccad80c84dc7709ee5a1ed346a05a934c48a2",
         intel: "c7b38b84f62c1997d86278b017710e11f809fb2e89f20503b2b542396d0a04b8"

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
