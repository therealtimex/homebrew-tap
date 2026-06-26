cask "realtimex@1.1.143-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.143-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "33ce91343531c7590a3dbabe035bfb444581bba4f76317be1569f92d863416b4",
         intel: "1808c1c9a56f2b276f8faa44feb38c996bc97f0568ee43607b8de036e7ca6689"

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
