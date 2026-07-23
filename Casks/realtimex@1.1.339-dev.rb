cask "realtimex@1.1.339-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.339-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8d2f36e5b3b4891c3dffa4e543682eee81a8a3075dd94fb419a1a19a204cddfb",
         intel: "f08acc8cf39680b168c956234b832656c50ee273aafcbecb0e8e305ac3b93579"

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
