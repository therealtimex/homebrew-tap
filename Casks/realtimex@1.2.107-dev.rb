cask "realtimex@1.2.107-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.107-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c1e4734e14b519adcf478efd2a4fb5aaa2b615c50d65e401554b7c15da2e01ef",
         intel: "844e6c8ca576b737c11d8b6aed523ab3b46bb588d9c6eb57f4347c65a9ad8d53"

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
