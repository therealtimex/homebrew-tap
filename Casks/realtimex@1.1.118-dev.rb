cask "realtimex@1.1.118-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.118-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f59fe542e05e81c66590a23987b1b4d4ed42e3840e72dc4add42d41b16e7d283",
         intel: "87002ee3d3b5257f95dedb86485b5b7deaae2d13b400ab900436ffb25216cdb8"

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
