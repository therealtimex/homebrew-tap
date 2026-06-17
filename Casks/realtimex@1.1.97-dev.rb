cask "realtimex@1.1.97-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.97-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "27d009f85da742465b48901e7286ffc80e558119030e8ccef40fdd430b05b64b",
         intel: "5185bfe4b8ffbe7f9d648f1b1d140f478b63282052913d6430520bf1128e8cc4"

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
