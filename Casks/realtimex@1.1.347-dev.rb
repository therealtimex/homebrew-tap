cask "realtimex@1.1.347-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.347-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "916c45ce241d92fb7c232f497f012d5a7867f3bd6066406f88561cc44235a38b",
         intel: "04aa2d90b60d83feef3eda337f276a708e346fff81afa3e6518effca59c12923"

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
