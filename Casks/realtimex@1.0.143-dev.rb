cask "realtimex@1.0.143-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.143-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "028107022a6c5bbc0ba6d98a7c757e1d18b87302bc4cb02f61ca18a729ba503e",
         intel: "487348512bc174942494a9c9f1bf087e27da85db5a0804120a1e77534ad3fd68"

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
