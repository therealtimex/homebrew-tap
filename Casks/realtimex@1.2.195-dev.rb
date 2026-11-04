cask "realtimex@1.2.195-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.195-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3d0a36b6ad606e0dccf4bf52f87a576a00f5f321e7bb71534f2289b00bbb44e9",
         intel: "8ceb73e84c3aabfccf08cb3ce133d89332da14e89eb957bb40be01a4a87c8521"

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
