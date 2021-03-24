# paper-template

[![pLaTeX](https://github.com/visual-computing-symposium/paper-template/actions/workflows/platex.yml/badge.svg)](https://github.com/visual-computing-symposium/paper-template/actions/workflows/platex.yml)

Visual Computingシンポジウム向けの論文テンプレートです。

## サポート

- pLaTeX (default)
- upLaTeX
- LuaLaTeX

## Overleafでの利用方法

Overleafで使用する場合、 `New Project` メニュー下にある `Upload Project` 項目を選択し, 予めダウンロードしておいた本テンプレートのZIPファイルをアップロードしてください。

## コンパイル方法

### Latexmkを用いたコンパイル（推奨）

本テンプレートには `latexmkrc` というLatexmk用の設定ファイルが含まれており、そのディレクトリにおいて下記のコマンドを打つだけでPDFファイルの生成まで行うことができます。
```bash
latexmk vc-template.tex
```

### その他の方法によるコンパイル

pLaTeX, pBibTeX, dvipdfmxなどを直接コマンドラインから呼び出すことでPDFファイルの生成をすることができます。
