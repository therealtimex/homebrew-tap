cask "realtimex@1.1.19-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.19-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1d0863d767bd2b061604f371841c03846a0d5e028033784cd7656e2aaac104db",
         intel: "108c42215aee2cd11c788d5dfad2b22a30287f0cdcfd0bade67519d0408fd838"

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
