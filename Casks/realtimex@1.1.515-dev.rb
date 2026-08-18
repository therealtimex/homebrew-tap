cask "realtimex@1.1.515-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.515-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "aeda61c54e2a4a0fa9ae78c61b4c07b5af273de3dd33cd85c5b3e0a22d87c6b6",
         intel: "54b9d5c29eab48fb485bf5d2e6b4285524562361a26caa6ddee3ebf4ae70b8a9"

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
