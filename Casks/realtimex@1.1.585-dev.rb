cask "realtimex@1.1.585-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.585-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c7358a8f68aa77ace906993abc9e6d4df43461deb7beca47aabea513a63dd750",
         intel: "5cb944c9f00f9e3575c8c0c689f3173281a380f55ff4e38eb762dfb3ed057fd2"

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
