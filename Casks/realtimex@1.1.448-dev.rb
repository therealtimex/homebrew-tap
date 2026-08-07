cask "realtimex@1.1.448-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.448-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6452d8e097020f2e4bac9911d196faa787dbe28148c4fb84893553c5471b8bd6",
         intel: "5bf9ff6e75771d6aba7b6884453f64538a8860dab5ec0b452e980d4c5f2aa9cd"

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
