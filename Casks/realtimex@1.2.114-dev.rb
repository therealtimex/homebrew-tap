cask "realtimex@1.2.114-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.114-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "df29c2be28a09a402e7dbb8f68fa2bcba0a9798d6cc019dcdfa693d35536d6ed",
         intel: "fb5b1da227027ca2002df608aebfebeeee2777611fe5973e3eccdbda51d33c96"

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
