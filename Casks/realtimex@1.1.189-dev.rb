cask "realtimex@1.1.189-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.189-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2d6b00f969e684e72885334ac8c0f851872bcdddf25a0272abb0d11f70f812a9",
         intel: "4aba51d7cec340854759d20ffb6104370f1da281051107bb0e1d030eab27136f"

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
