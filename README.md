# Bomb Rush Cyberfunk GRUB Theme

A **Y2K / Frutiger Aero-inspired** GRUB theme based on *Bomb Rush Cyberfunk* aesthetics.
Neon colors, smooth highlights, and progress bar styling.

## ✨ Features

* Custom highlight bar (`highlight.png`) with neon #66ff66 glow
* Styled progress bar (`progress_bg.png`)
* Cyberfunk font (`cyberfunk.pf2`)
* Background artwork included

## 📦 Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/YOURNAME/bomb-rush-cyberfunk-grub-theme.git
   cd bomb-rush-cyberfunk-grub-theme
   ```

2. Install theme into GRUB themes folder:

   ```bash
   sudo mkdir -p /boot/grub/themes/bombrush
   sudo cp -r ./* /boot/grub/themes/bombrush/
   ```

3. Set the theme in GRUB:

   ```bash
   echo 'GRUB_THEME="/boot/grub/themes/bombrush/theme.txt"' | sudo tee -a /etc/default/grub
   sudo grub-mkconfig -o /boot/grub/grub.cfg
   ```

4. Reboot and enjoy 🚀

## 🖼️ Preview

*(screenshot placeholder here)*

## ⚠️ Notes

* Fonts must be `.pf2` format. If you want to convert another font:

  ```bash
  grub-mkfont -o fonts/yourfont.pf2 -s 24 path/to/font.ttf
  ```
* Works on Arch, Debian, Ubuntu, and most distros with GRUB2.

---

