cask "realtimex@1.1.291-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.291-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "36cc9c745cc75d8c06ffd54fa59420337b1f0bffc6ba2768bbddcf03d07d33a2",
         intel: "081a975881611b47e9db9df6271f83aa0456d11b6a8ed5abc26f23695234dbaf"

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
