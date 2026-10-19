cask "realtimex@1.2.69-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.69-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6d011acc8ba9aa5f938b34df9b794818d678f462dc0b6061ea9251459eae5118",
         intel: "a6a7804c6c95c4399faeabe49f77d6d8ef007d49fec6d64660e596e2a9b3205d"

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
