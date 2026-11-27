class Tnl < Formula
  desc "tunnels for local apps and private services."
  homepage "https://github.com/madebyentropy/tnl"
  version "0.1.0-rc.50"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/madebyentropy/tnl/releases/download/v0.1.0-rc.50/tnl_0.1.0-rc.50_darwin_arm64.tar.gz"
      sha256 "a717e9e70f047e25a7a6b8ae4053e01a88d960a025921081b0bd2dfb0a82f3ef"
    end

    on_intel do
      url "https://github.com/madebyentropy/tnl/releases/download/v0.1.0-rc.50/tnl_0.1.0-rc.50_darwin_amd64.tar.gz"
      sha256 "47f21c55f8a07801f39e1a3acfd7d9d6efda953b94f7ae8bd612bad57c813421"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/madebyentropy/tnl/releases/download/v0.1.0-rc.50/tnl_0.1.0-rc.50_linux_arm64.tar.gz"
      sha256 "57830f385b05a9deeea71fa4bd400b01c2fbb356a4e039809da4a9503082fd03"
    end

    on_intel do
      url "https://github.com/madebyentropy/tnl/releases/download/v0.1.0-rc.50/tnl_0.1.0-rc.50_linux_amd64.tar.gz"
      sha256 "3e8e7f3b236d08ffa13b9e725889f37f516964d0c1decaf4486ab2b9c7d6b6d2"
    end
  end

  def install
    bin.install "tnl", "tnld"
    %w[tnl tnld].each do |name|
      generate_completions_from_executable(bin/name, "completion", shells: [:bash, :zsh, :fish])
    end
  end

  test do
    assert_match(/^tnl #{Regexp.escape(version.to_s)} \([0-9a-f]{40}\)$/, shell_output("#{bin}/tnl version").strip)
    assert_match(/^tnld #{Regexp.escape(version.to_s)} \([0-9a-f]{40}\)$/, shell_output("#{bin}/tnld version").strip)
  end
end
