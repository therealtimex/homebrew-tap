cask "realtimex@1.0.127-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.127-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "feb810b03297e76084cfdbde476405f4e2f0ef95ffa00e1da4d8045b2e489066",
         intel: "bd1e2e3c1ced94375ddd58c565ebb350c0e7f4288dc325e1640c7793cdf2297c"

  # Use the #{arch} variable in your URL
  url "https://github.com/therealtimex/realtimex/releases/download/v#{version}/RealTimeX.AI-#{version}#{arch}.dmg"

  name "RealTimeX"
  desc "Find powerful AI Agents for RealTimeX"
  homepage "https://realtimex.ai/"

  depends_on formula: "redis"
  app "RealTimeX.AI.app"

  caveats <<~EOS
    RealTimeX.AI will be placed in Applications.
  EOS
end
