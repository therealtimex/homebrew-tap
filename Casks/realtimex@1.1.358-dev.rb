cask "realtimex@1.1.358-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.358-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9fb317ff59ca861276e2c8312638163f630fc9452e152f54b237fa6862d52123",
         intel: "5764b90800d7952d5059c90b5bf8149f30ce8ac463a26882aeadeb37af23eace"

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
