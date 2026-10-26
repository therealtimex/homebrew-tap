cask "realtimex@1.2.126-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.126-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6b8dfad3c37e9ad010dd135a9947e60096c7b6ee0dba1189f37f6412af3b007e",
         intel: "a1d14cce0e88a76a92d74e19b601a629205fae2d73fd98bf2286d94e901ad126"

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
