cask "realtimex@1.2.185-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.185-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0355d5b56a0935cdfbddd723bfbb0608c3005ab6664f010228c4cabf3ba473e2",
         intel: "fcddeed57a6f20b9159b46071c864369d451b130634da7064070e03810af0b9c"

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
