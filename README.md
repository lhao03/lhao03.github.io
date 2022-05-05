# my personal website yet again in zola 

[![github pages](https://github.com/lhao03/lhao03.github.io/actions/workflows/main.yml/badge.svg)](https://github.com/lhao03/lhao03.github.io/actions/workflows/main.yml)

## how to make it work
- install zola: https://www.getzola.org/documentation/getting-started/overview/
- to render the site ```zola serve```.

```bash
(for dir in Papers/Unread/*     
do
    echo "${dir##*/}" ; ls $dir
done) >> codes/lhao03.github.io/content/blog/papers/_index.md
```
