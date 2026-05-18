cask "realtimex@1.0.216-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.216-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "cb03c0bbae82a186634503327feaddf0442fedfc4c5111f87c189131eb0d0f8c",
         intel: "1e91af948a6a07307298ae0c801566f6a2abbfe669972700a918d141d24bdb52"

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
