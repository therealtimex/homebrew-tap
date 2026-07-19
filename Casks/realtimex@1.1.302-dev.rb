cask "realtimex@1.1.302-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.302-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "114a7453118dfa53d890862e9c1bf0f0f0723eb795bdc2b8581076688db8f49f",
         intel: "56794a19f2877cfa92ff178a188af4ed7e97eb225d2b7829a63b077b9a740318"

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
