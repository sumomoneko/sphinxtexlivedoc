.. -*- mode: rst -*-

概要
####

sphinx のhtml, latex ビルド用のコンテナ

- `plantuml <http://plantuml.com/ja/>`__ に対応
- `nwdiag <http://blockdiag.com/ja/nwdiag/sphinxcontrib.html>`__/
  `blockdiag <http://blockdiag.com/ja/blockdiag/sphinxcontrib.html>`__/
  seqdiag/actdiagに対応
- `markdown <https://recommonmark.readthedocs.io/en/latest/index.html#>`__ に対応
- `sphinx-autobuild <https://pypi.org/project/sphinx-autobuild/>`__ に対応
- `sphinx_rtd_theme <https://github.com/readthedocs/sphinx_rtd_theme>`__ テーマ対応
- latexターゲットビルド

使い方
######

.. code-block:: sh

   $ docker run -it --rm -v $(pwd):/workdir spx sphinx-quickstart
   $ docker run -it --rm -v $(pwd):/workdir spx make latexpdf
   $ docker run -it --rm -v $(pwd):/workdir spx make html
   $ docker run -p 8000:8000 --rm -v $(pwd):/workdir spx sphinx-autobuild -b html --host 0.0.0.0 . /_build/html

サンプル
########

.. nwdiag::
   :caption: ネットワーク図
   :align: center

   nwdiag {
     network dmz {
         address = "210.x.x.x/24"

         // set multiple addresses (using comma)
         web01 [address = "210.x.x.1, 210.x.x.20"];
         web02 [address = "210.x.x.2"];
     }
     network internal {
         address = "172.x.x.x/24";

         web01 [address = "172.x.x.1"];
         web02 [address = "172.x.x.2"];
         データベース01;
         データベース02;
     }
   }

.. blockdiag::
   :caption: ブロック図サンプル
   :align: center

   blockdiag admin {
      // Set M17N text using label property.
      A [label = "起"];
      B [label = "承"];
      C [label = "転"];
      D [label = "結"];

      A -> B -> C -> D;

      // Use M17N text directly (need to quote).
      春 -> 夏 -> 秋 -> 冬;

      // Use M17N text including symbol characters (need to quote).
      "春は 曙" -> "夏 = 夜" -> "秋.夕暮れ" -> "冬 & つとめて";
   }

.. seqdiag::
   :caption: シーケンス図サンプル
   :align: center

   seqdiag {
      A -> B -> C;
      A [description = "browsers in each client"];
      B [description = "web server"];
      C [description = "database server"];
   }

.. actdiag::
   :caption: アクティビティ図サンプル
   :align: center

   actdiag {
     write -> convert -> image

     lane user {
        label = "User"
        write [label = "Writing reST"];
        image [label = "Get diagram IMAGE"];
     }
     lane actdiag {
        convert [label = "Convert reST to Image"];
     }
   }


.. uml::
   :caption: シーケンス図サンプル
   :align: center

   ' モノクロにする
   skinparam monochrome true

   ' 影をなくす
   skinparam shadowing false

   ' 手描き風にする
   skinparam handwritten true

   漢字 -> Bob: Hi!
   漢字 <- Bob: How are you?


.. uml::
   :caption: ワイヤーフレーム GUI
   :align: center

   salt
   {
     Just plain text
     [This is my button]
     ()  Unchecked radio
     (X) Checked radio
     []  Unchecked box
     [X] Checked box
     "Enter text here   "
     ^This is a droplist^
   }

markdownのサンプルはこちら。 :doc:`markdown_sample`
