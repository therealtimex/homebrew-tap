cask "realtimex@1.0.154-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.154-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e23a55972bb127d101fe5e823d6608ec50f1d84add1ef22557434e3f6a2736b3",
         intel: "09dd51de9ccac622d342af3a3855b1c0377943a62544d7964d6ad11c15821650"

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
