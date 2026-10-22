cask "realtimex@1.2.87-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.87-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a6685d0c6604379050f7b6edfaa69b0ccbb1c11186dd587e985d59e919e6e657",
         intel: "d1945c33a97a8285d708a5620c2ad28a0b5e675b5882af0bd73a7124346c17bb"

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
