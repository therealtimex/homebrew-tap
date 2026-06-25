cask "realtimex@1.1.135-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.135-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9660271df03e2fd1f9007f484e1dd64441d96fdc3ba69da882cf1664f1fec9a2",
         intel: "b4270268a1fb2cb4ecb79bc50db5033a5ce00925b3d1d216b45db726f397d108"

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
