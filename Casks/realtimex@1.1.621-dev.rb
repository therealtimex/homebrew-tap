cask "realtimex@1.1.621-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.621-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "37bfda965d0f294a9ca5e94a294060af4288d90c78f310dc803288b8368bbca0",
         intel: "dcfb1359aaf848857e556081695589b9f2dedc5ef5c72e6a2f84ee0b5155625e"

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
