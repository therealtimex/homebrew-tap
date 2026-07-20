cask "realtimex@1.1.313-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.313-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c1cc7c01750b8f1d29314a3c2f92014eb0028d545974faed81ece8efa2549a4a",
         intel: "d44af1ff2710a3836ebd13c6001d5723c25a98d8e2ab76a9f8b6fbaa3397955c"

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
