cask "realtimex@1.1.468-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.468-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6fe00217926905c9302706b77419f7d396aafcc8359a7c39fc0330133e58aca4",
         intel: "2cf1d4ec05efdd264718063e3dffa3fbf24fd1980fcc57f8e1df18b94eaf933f"

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
