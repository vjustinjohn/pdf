<cfcontent type="application/pdf">
<cfprocessingdirective pageencoding="utf-8">
<cfdocument format="PDF" filename="./pdf_font_japanese.pdf" overwrite="Yes" fontEmbed = "yes">
<cfoutput>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> <title>PDF Export Example</title>
<style> body { font-family: Verdana; }
h1 { font-size: 14px; }
p { font-size: 12px; line-height: 1.25em; margin-left:20px;} </style>
</head> <body>
<h1>PDF Export Example Combined Japanese & English</h1>
<p>Font of this English content is not Verdana 日本人は単純な音素配列論で膠着、モーラ·タイミングの言語、純粋な母音システム、
音素の母音と子音の長さ、および語彙的に重要なピッチアクセント。語順は通常、粒子が言葉の文法的機能をマ ーキング対象オブジェクトと動詞であり、
文の構造は、トピック·コメントです。文末粒子は、感情的または強調の影響を追加したり、
質問を作るために使用されます。名詞は文法的に番号や性別を持たず、
何の記事はありません。動詞は主に緊張し、音声ではなく、 人のために、コンジュゲートされる。形容詞の日本の同等物は、
また、結合している。日本人は動詞の形や語彙、話者の相対的な地位、
リスナーおよび掲げる者を示すと敬語の複雑なシステムを持っています。Font of this English content is not Verdana. </p>
<h1>PDF Export English Example</h1>
<p>Font of this English content is Verdana. </p> </body> </html> 
</cfoutput> 
</cfdocument>
<cflocation url="./pdf_font_japanese.pdf" addtoken="false">