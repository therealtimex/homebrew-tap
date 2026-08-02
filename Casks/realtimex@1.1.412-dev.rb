cask "realtimex@1.1.412-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.412-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e984e075567990fd1cc59e80652ba98dd342a4c495c1c9e175bf47adcc8c0ccd",
         intel: "f0d3ad3f760df4024655691228c1e33ada9e677fc74ea198a2e214412c90ea7c"

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
