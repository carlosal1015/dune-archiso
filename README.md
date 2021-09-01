<div align="center">
  <img alt="Dune Numerics" height="100px" vspace="" hspace="10"
    src="https://dune-project.org/share/dune-logo.svg?sanitize=true">
  <img alt="CyberOS" height="100px" vspace=""
    src="https://git.omame.tech/CyberOS/website-wip/raw/branch/master/src/assets/images/cyber-logo.svg?sanitize=true">
</div>

<h1 align="center">
  An <a href="https://gitlab.archlinux.org/archlinux/archiso">archiso</a>
  <a href="https://git.omame.tech/CyberOS/cyberos-iso">profile</a>
  based on <a href="https://getcyberos.org">CyberOS</a>
  with
  <a href="https://aur.archlinux.org/packages/dune-common">DUNE Numerics</a>
  <sup><a href="#fn1">*</a></sup>
</h1>

<sup id="fn1">
* working in progress, due undefined reference to a <code>xdrstdio_create</code>
function since that Archlinux switch from a Sun provided implementation to the
<a href="https://archlinux.org/packages/core/x86_64/libtirpc"><code>libtirpc</code></a>
package which causes issues.
<b>Credits</b>: v2.7.1 <code>dune-common</code>'s
<a href="https://aur.archlinux.org/packages/?K=PrinceMachiavell&SeB=m">maintainer</a>
from AUR.
<br>
** More news soon! We succesfully compiled the <code>dune-uggrid</code> module!
</sup>

<p align="center">
  <a href="https://github.com/carlosal1015/dune-archiso/issues">
    <img alt="GitHub issues" src="https://img.shields.io/github/issues/carlosal1015/dune-archiso">
  </a>
  <a href="https://github.com/carlosal1015/dune-archiso/blob/main/LICENSE">
    <img alt="GitHub license" src="https://img.shields.io/github/license/carlosal1015/dune-archiso">
  </a>
  <img alt="GitHub release (latest by date)" src="https://img.shields.io/github/v/release/carlosal1015/dune-archiso">
  <img alt="Powered by Qt" src="https://forthebadge.com/images/badges/powered-by-qt.svg">
</p>

### Get The ISO

You can either download already generated ISO file from

<p align="center">
  <a href="https://sourceforge.net/projects/dune-archiso/files/latest/download" target="_blank">
    <img style="vertical-align:middle" alt="Sourceforge" height="30px"
      src="https://img.shields.io/badge/Sourceforge-Download-orange?style=for-the-badge&logo=sourceforge">
  </a>
  or
  <a href="https://nightly.link/carlosal1015/dune-archiso/workflows/release/main/ISO-artifact.zip"
    target="_blank">
    <img style="vertical-align:middle" alt="GitHub" height="30px"
      src="https://img.shields.io/static/v1.svg?label=Download%20now&message=💿&color=black&logo=GitHub&logoColor=white&labelColor=black.svg">
  </a>.
</p>

Some packages are from [here](https://carlosal1015.gitlab.io/dune-archiso-repository).

<!-- [![Download this iso from GitHub Releases](https://img.shields.io/static/v1.svg?label=Download%20now&message=💿&color=black&logo=GitHub&logoColor=white&labelColor=black.svg)](https://github.com/carlosal1015/dune-archiso/releases/latest/download/archlinux-2021.02.16-x86_64.iso) -->

<div align="center">
<p align="center">
  <blockquote>
    This source code was taken from
    <a href="https://git.omame.tech/CyberOS/cyberos-iso">this archiso profile</a>
    for <a href="https://getcyberos.org">CyberOS</a>, a
    <a href="https://upload.wikimedia.org/wikipedia/commons/1/1b/Linux_Distribution_Timeline.svg">linux distribution</a>
    built with <a href="https://doc.qt.io/qt-5/qtquick-index.html">Qt Quick</a>
    and <a href="https://archlinux.org">Arch Linux</a>.
  </blockquote>
</p>
  <img alt="CyberOS Desktop" height="480px"
    src="https://git.omame.tech/CyberOS/cyberos.github.io/raw/branch/master/src/images/preview_dark.png">
  <img alt="CyberOS Settings" height="600px"
    src="https://git.omame.tech/CyberOS/cyberos.github.io/raw/branch/master/src/images/preview_light.png">
</div>

> Since September 2021, there will be a new release every first day of the month, like Arch Linux.