cask "realtimex@1.0.123-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.123-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "eb0281869425e652397c0306a639033140593cf0fb484f132ba9f1654c09f58d",
         intel: "1666a6741aee91091e2881441bb5f11b213eaf31dcfb59693a9c527d49cbd9cb"

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
