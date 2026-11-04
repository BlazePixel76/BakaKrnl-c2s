# BakaKrnl-c2s

Build scripts, kernel config fragment, and manual-hook patches for running
[BakaSU](https://github.com/Baka-SU/BakaSU) (formerly ReSukiSU) on the
Samsung Galaxy Note20 Ultra 5G (SM-N986B, codename `c2s`) running
LineageOS 24 (Android 17).

**Full kernel source:** https://github.com/BlazePixel76/android_kernel_samsung_universal9830 (branch `resukisu`, tag `v1.0.0-c2s`)

This repo alone is not buildable — it's a companion to the fork above.
That fork is what you actually build; this repo just documents and
automates the process.

## What this is

- Kernel: Linux 4.19.325, non-GKI, LineageOS's `universal9830` (Exynos 990) tree
- Root: BakaSU `516d3e87` (`v4.2.0-rc3`), using **manual hooks** (non-kprobe,
  non-tracepoint — required for non-GKI 4.19 kernels)
- Hooks applied by hand: `execveat`, `faccessat`, `stat`/`newfstat`/`fstat64`,
  `sys_reboot`. Setuid, init-rc and input hooks are automatic via LSM/input
  handler, no patching needed.
- No SUSFS / root-hiding features. Manual hooks only.

## Directory structure

- `config/bakakrnl.fragment` — Kconfig fragment (KSU manual hook, kernel name)
- `patches/0001-resukisu-manual-hooks.patch` — the hand-written hooks, as a
  diff against the LineageOS base commit noted in the patch header
- `scripts/build.sh` — builds the kernel with clang/LLVM
- `scripts/pack.sh` — repacks `boot.img` (mkbootimg + AVB footer) and tars it
  for Odin

## Downloads

Flashable `.tar` builds are on the [Releases](../../releases) tab of this repo.

## Building it yourself

1. Clone the full source: `git clone --recurse-submodules -b resukisu https://github.com/BlazePixel76/android_kernel_samsung_universal9830`
   (the patches in this repo are already applied there — you only need this
   repo if you want to rebase the hooks onto a newer LineageOS commit)
2. Apply `patches/0001-resukisu-manual-hooks.patch` if starting from a clean
   LineageOS checkout instead
3. Merge `config/bakakrnl.fragment` into your defconfig
4. Run `scripts/build.sh`, then `scripts/pack.sh <name>`
5. Flash the resulting `<name>.tar` via Odin (AP slot) — keep a stock
   `boot.img` backup first

## Credits

- **LineageOS Team** — `universal9830` device kernel source
- **[weishu](https://github.com/tiann)** and the **KernelSU** project — the
  original kernel-based root solution this is all built on
- **[Baka-SU](https://github.com/Baka-SU/BakaSU)** (formerly ReSukiSU) — the
  KernelSU fork and manual-hook implementation this kernel actually runs
- **BlazePixel76** — hook integration for this device, build scripts

## License

This kernel is Linux, licensed under **GPL-2.0-only**. See [LICENSE](LICENSE).
The scripts in this repo are provided under the same terms unless noted
otherwise.
