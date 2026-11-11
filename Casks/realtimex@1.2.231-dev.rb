cask "realtimex@1.2.231-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.231-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "440b7aceff499b80e0e1ce1fc41466d2f53e8ae93ccd8c7b013c53b39c42263e",
         intel: "43db7b7b4ab9cbb0f6e34c6b5bb9a866647a4eb1aeb0af60b830b91d9e9e0e00"

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
