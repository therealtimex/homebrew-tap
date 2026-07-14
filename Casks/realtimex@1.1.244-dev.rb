cask "realtimex@1.1.244-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.244-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a8ba168f1e1b794bf2e6678fbfd34ecfe4db1a29f65b71179eb41d81c7ef9ca5",
         intel: "5bb9c81d91571dba4c59d61833859c34180b52ff25eac3fa01b26d6df145f525"

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
