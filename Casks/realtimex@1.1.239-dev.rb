cask "realtimex@1.1.239-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.239-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "71b7e9d19d9d50a816608df26d1fdeeb59fb815e872ad742eb4cae18e7cf614c",
         intel: "041837f3c983db71a968ad2863142321bdf438788824c50659227a27fdecb046"

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
