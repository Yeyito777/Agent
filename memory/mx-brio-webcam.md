<memory-metadata>
{
  "frequency": 0,
  "last_accessed_session": 1229,
  "created_session": 1229,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions Logitech MX Brio, webcam configuration, /dev/video0, uvcvideo driver, camera settings, or USB ID 046d:0944.
</conditional>

<fuzzy-match>
MX Brio, Logitech, webcam, camera, /dev/video0, uvcvideo, MJPG, udev rules, 046d:0944, 1080p, 4K, MJPEG, video device, USB camera
</fuzzy-match>

<memory>
MX Brio webcam — USB ID 046d:0944, XHCI ASMedia quirk fix project, kernel patch required

User has a Logitech MX Brio webcam (USB ID: 046d:0944) on USB-C.

**Hardware issue:** The USB-C port is on the AMD 500 Series XHCI controller (PCI 1022:43ee) which uses ASMedia IP (subsystem 1b21:1142). The kernel's quirk matching only checks PCI vendor, so ASMedia quirks are never applied. This causes:
- Burst spurious TRB DMA events (comp_code 13) after short packets
- "ERROR Transfer event TRB DMA ptr not part of current TD"
- URBs never complete, UVC times out, zero video frames captured

**Fix project:** `~/Workspace/xhci-asmedia-fix/`
- Kernel patch: `0004-xhci-asmedia-spurious-success-quirk.patch`
  - Adds `XHCI_SPURIOUS_SUCCESS` for device 1022:43ee in xhci-pci.c
  - Preserves `old_trb_comp_code` in xhci-ring.c so burst spurious events are all caught
- Build dir: `kernel-build/` (Arch linux-lts PKGBUILD with patch)
- Reference doc: `reference/approaches.md` (4 approaches documented)
- DKMS module also exists but insufficient since xhci is built-in (=y)

**Webcam specs:**
- Max: 4K (3840x2160) @ 30fps MJPG
- Target config: 1080p @ 60fps MJPG
- Driver: uvcvideo

**Qutebrowser config for camera:**
- `disable-features=UseCameraPipeWire` in qt.args (forces V4L2 direct)
- Video capture permission set for discord.com

**Udev rule:** `/etc/udev/rules.d/90-mx-brio.rules` — auto-sets 1080p@60fps MJPG on plug-in with a 2-second delay. Re-created on kernel 6.18.9-arch1-2 (previously removed on an older kernel because it raced firmware init and caused hangs).

---
Update when the kernel patch is installed and tested, or if upstream accepts the patch.
</memory>
