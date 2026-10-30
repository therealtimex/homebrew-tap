cask "realtimex@1.2.156" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.156"

  # Provide both SHA256 hashes
  sha256 arm:   "2b9eecd8fc0b40fc5e0645a6c3a0341495667cc1b84a304ec2cc1671381fc78e",
         intel: "9a9ee91d000acdaff64a297545e09ab663b7fb7c78914bfc586af415083fd232"

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
