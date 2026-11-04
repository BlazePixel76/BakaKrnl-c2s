# BakaKrnl-c2s

Custom ReSukiSU Linux 4.19 kernel overlay and build workflow for the Samsung Galaxy Note20 Ultra (Exynos 990 / c2s) running LineageOS 24 (Android 17).

## Introduction

This repository contains the configuration fragments, patches, and build scripts used to compile a custom ReSukiSU-enabled Linux 4.19 kernel for the Galaxy Note20 Ultra. It is specifically designed to work with LineageOS 24 while maintaining proper in-kernel root management without heavy performance tweaks or overclocks.

## Directory Structure

- `config/` - Kernel fragment configuration (`bakakrnl.fragment`)
- `patches/` - ReSukiSU driver integration and manual hooks
- `scripts/` - Automated build (`build.sh`) and Odin packaging scripts (`pack.sh`)

## Downloads

Grab the latest flashable `.tar` build from the [Releases](https://github.com/BlazePixel76/BakaKrnl-c2s/releases) tab.

## How to Use & Fork

If you want to build or modify this kernel yourself:
1. Clone the official LineageOS 24 kernel source tree for `universal9830`.
2. Apply the manual hook patches from the `patches/` directory.
3. Merge `config/bakakrnl.fragment` into your kernel configuration.
4. Run the build script to compile the kernel and package it into an Odin-flashable tarball using `pack.sh`.

## Credits

- **LineageOS Team** - Base device trees and kernel source.
- **ReSukiSU Contributors** - Root implementation framework.

## License

This project is licensed under the **GPL-2.0 License**, in compliance with the Linux kernel's licensing requirements.
