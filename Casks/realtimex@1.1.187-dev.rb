cask "realtimex@1.1.187-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.187-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a7fccd1f60ec1173981f31d8a80185a0ee4f18e3a906f6ac9ac760ec11192530",
         intel: "33851bb4d7e2206f5ec1a9406e15a0601a7642f11023ac82aab2f6abb8f52ac7"

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
