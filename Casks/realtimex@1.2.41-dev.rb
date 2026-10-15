cask "realtimex@1.2.41-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.41-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "03043cd30df57d5ebc660cfd67745f217f90ed4bf8982a998bdfc01d20deafa4",
         intel: "22ff20cfdcfeb17ba4a9c2abb02e2c10e37fa3156b4e1b45cd052451a5ebceaf"

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
