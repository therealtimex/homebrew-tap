cask "realtimex@1.2.104-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.104-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6bdb5d61f68880837ca4e8be5c5321b46f1f21f25ea70cd6e1d459f9311bfdb6",
         intel: "28dd18e35224592db59e4ad2f7dabe3ffe14f4de26108f3d5170e5235bd4583c"

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
