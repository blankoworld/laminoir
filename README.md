# laminoir

Document generation using Pandoc with Markdown text input.

# Content

Document's content is available under **content** directory.

Only `*.md` files would be read ([Markdown format](https://daringfireball.net/projects/markdown/)).

# Usage

```bash
make clean && make
```

# Variables

TODO: complete this section

# Add page break

With [pandoc's raw\_attribute plugin](https://pandoc.org/MANUAL.html#extension-raw_attribute), just add this in Markdown files:

```{=openxml}
<w:p>
  <w:r>
    <w:br w:type="page"/>
  </w:r>
</w:p>
```

# License

This software is granted under [GNU General Public License v3](https://www.gnu.org/licenses/gpl-3.0.en.html).

# Contact

This project is available under [laminoir project Github's page (by blankoworld)](https://github.com/blankoworld/laminoir/).
