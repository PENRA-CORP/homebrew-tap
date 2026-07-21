# Formula auto-gérée : le workflow `publish` du repo PENRA-CORP/Condense met à jour
# `url` et `sha256` à chaque release (tag v*). Ne pas éditer à la main.
class Condense < Formula
  desc "CLI qui optimise les tokens envoyés à Claude & Codex"
  homepage "https://github.com/PENRA-CORP/Condense"
  url "https://registry.npmjs.org/@penra/condense/-/condense-0.1.26.tgz"
  sha256 "5579559242b32869da9e6dc5b7ef0bf0058a4deac6fac2c70a2cebaf7ac3f92d"
  license "MIT"
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/condense --version")
  end
end
