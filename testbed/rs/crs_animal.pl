package SWResource_animal;

#----------------------------------------
# キャラセット
#----------------------------------------

sub GetRSChr {
  my $sow = $_[0];

  my $maker = $sow->{'cfg'}->{'CID_MAKER'};
  my $admin = $sow->{'cfg'}->{'CID_ADMIN'};

  # キャラの表示順
  my @order = (
    'c49',  # c49  にほんざる ボリス 
    'c38',  # c38  だいおういか コリーン 
    'c77',  # c77  にんじん キャロライナ 
    'c35',  # c35  ごりら ダン 
    'c53',  # c53  やみふくろう ゼルダ 
    'c74',  # c74  はいびすかす フランシスカ 
    'c50',  # c50  きつね ディーン 
    'c36',  # c36  さらぶれっど ミッシェル 
    'c26',  # c26  えりまきとかげ モニカ 
    'c55',  # c55  もるふぉちょう パピヨン 
    'c29',  # c29  しまうま イアン 
    'c16',  # c16  あふりかぞう マリアンヌ 
    'c34',  # c34  すなねずみ トニー 
    'c44',  # c44  いわとびぺんぎん ドナルド 
    'c11',  # c11  みけ カルヴィン 
    'c10',  # c10  そまり ゾーイ 
    'c70',  # c70  かんがるー パティ 
    'c56',  # c56  ぶた ゴドウィン 
    'c07',  # c07  てのりぶんちょう ティモシー 
    'c41',  # c41  ろぶすたー ヤニク 
    'c58',  # c58  ゆにこーん ブルーノ 
    'c17',  # c17  おらうーたん ユリシーズ 
    'c39',  # c39  もみのき シビル 
    'c40',  # c40  らいおん ハワード 
    'c65',  # c65  ちすいこうもり ズリエル 
    'c59',  # c59  れとりばー ムパムピス 
    'c57',  # c57  らくだ ツェツィーリヤ 
    'c04',  # c04  くろひょう ノーリーン 
    'c46',  # c46  あらいぐま ゲイル 
    'c14',  # c14  くらげ レティーシャ 
    'c09',  # c09  にほんおおかみ ヒロシ 
    'c42',  # c42  みつりょうしゃ ラルフ 
    'c37',  # c37  ぺるしゃ セシル 
    'c75',  # c75  いえてぃ ビリー 
    'c32',  # c32  きんぎょ オスカー 
    'c33',  # c33  ねったいぎょ ホリー 
    'c02',  # c02  よーくしゃーてりあ アルフレッド 
    'c66',  # c66  ばいにん クリストファー 
    'c24',  # c24  ぶるどっぐ ナタリア 
    'c79',  # c79  わかめ マーゴ 
    'c61',  # c61  すっぽん ヌマタロウ 
    'c23',  # c23  ぱんだ チャールズ 
    'c28',  # c28  うさぎ ケイト 
    'c68',  # c68  なまこ ヨアヒム 
    'c30',  # c30  おうむ フィリップ 
    'c21',  # c21  おおたこ ニール 
    'c52',  # c52  ありじごく ギリアン 
    'c51',  # c51  かげろう ヨーランダ 
    'c01',  # c01  こじか メアリー 
    'c69',  # c69  びーる ギネス 
    'c63',  # c63  おこじょ ピッパ 
    'c05',  # c05  いとまきえい キャサリン 
    'c22',  # c22  うちゅうせん ワット 
    'c62',  # c62  きつねりす ヴェラ 
    'c13',  # c13  かたつむり ロミオ 
    'c18',  # c18  かまきり エマ 
    'c27',  # c27  ひつじ リンダ 
    'c08',  # c08  たぬき ベネット 
    'c19',  # c19  あげはちょう タバサ 
    'c71',  # c71  なまけもの ノックス 
    'c03',  # c03  かもすぞ スティーブン 
    'c43',  # c43  くまー ガストン 
    'c15',  # c15  しゃち ウェーズリー 
    'c54',  # c54  さめ ザック 
    'c25',  # c25  うし ルーカス 
    'c20',  # c20  とら グロリア 
    'c72',  # c72  ほたる ヴェスパタイン 
    'c47',  # c47  しろまどうし ペラジー 
    'c80',  # c80  りかおん テッド 
    'c105',  # c105  うみねこ シメオン 年末カウントダウン♪
    'c96',  # c96  せあかごけぐも レオナルド 2011/12/11
    'c95',  # c95  やもり モリス 2011/12/11
    'c97',  # c97  しぇぱーど ジェフ 2011/12/14 超常現象はあるんだ…
    'c98',  # c98  はしびろこう オズワルド 2011/12/29 この髭はぜったいワックス使ってる。
    'c100',  # c100  びーばー グレッグ 2012/12/30 スポーツ系中学生くらいに見える
    'c101',  # c101  すずらん クラリッサ 2011/12/30 美人さん♪
    'c104',  # c104  みいら ヒュー 年末カウントダウン♪
    'c106',  # c106  まんぼう ワンダ 年末カウントダウン♪
    'c108',  # c108  ぶろっこりー ブローリン 年末カウントダウン♪
    'c90',  # c90  さい ケヴィン 2011/12/06
    'c88',  # c88  ゆでたまご ピエール 2011/12/05
    'c89',  # c89  かば カトリーナ 2011/12/06
    'c84',  # c84  しろへび ブレンダ 2011/12/05
    'c85',  # c85  かみつきがめ ハナ 2011/12/05
    'c91',  # c91  あるぱか ドロシー 2011/12/06 姦しい奥様♪
    'c92',  # c92  さば セレスト 2011/12/06 姦し娘ーず♪
    'c93',  # c93  わらいかわせみ ベッキー 2011/12/06 えー○○が許されるのは小学生までだよねー♪
    'c78',  # c78  かめれおん ネイサン 
    'c82',  # c82  どぶねずみ ロビン 
    'c109',  # c109  しろちゃとら ラディスラヴァ 年末カウントダウン♪
    'c94',  # c94  あかまむし ダーラ 2011/12/11
    'c102',  # c102  さんた ウォーレン 年末カウントダウン♪
    'c73',  # c73  くりおね ローズマリー 
    'c81',  # c81  ふぇねっく サイラス 
    'c64',  # c64  やまあらし ヘクター 
    'c107',  # c107  いぼいのしし イヴォン 年末カウントダウン♪
    'c67',  # c67  りす ソ\フィア 
    'c76',  # c76  めがねざる ジョージ 
    'c60',  # c60  はむすたー ポーチュラカ 
    'c45',  # c45  はいえな プリシラ 
    'c87',  # c87  りゅう エリアス 2011/12/05
    'c48',  # c48  くじゃく ビアンカ 
    'c86',  # c86  かも ホレーショー 2011/12/05
    'c83',  # c83  いそぎんちゃく アイリス 
    'c31',  # c31  かえる ネル 
    'c103',  # c103  おうむがい ナンシー 年末カウントダウン♪
    'c99',  # c99  しんかいぎょ サイモン 
    'r12',  # r12  うえきばち バーナバス 
  );

  # キャラの肩書き
  my %chrjob = (
    'c01' => 'こじか',  # c01  こじか メアリー 
    'c02' => 'よーくしゃーてりあ',  # c02  よーくしゃーてりあ アルフレッド 
    'c03' => 'かもすぞ',  # c03  かもすぞ スティーブン 
    'c04' => 'くろひょう',  # c04  くろひょう ノーリーン 
    'c05' => 'いとまきえい',  # c05  いとまきえい キャサリン 
    'c07' => 'てのりぶんちょう',  # c07  てのりぶんちょう ティモシー 
    'c08' => 'たぬき',  # c08  たぬき ベネット 
    'c09' => 'にほんおおかみ',  # c09  にほんおおかみ ヒロシ 
    'c10' => 'そまり',  # c10  そまり ゾーイ 
    'c100' => 'びーばー',  # c100  びーばー グレッグ 2012/12/30 スポーツ系中学生くらいに見える
    'c101' => 'すずらん',  # c101  すずらん クラリッサ 2011/12/30 美人さん♪
    'c102' => 'さんた',  # c102  さんた ウォーレン 年末カウントダウン♪
    'c103' => 'おうむがい',  # c103  おうむがい ナンシー 年末カウントダウン♪
    'c104' => 'みいら',  # c104  みいら ヒュー 年末カウントダウン♪
    'c105' => 'うみねこ',  # c105  うみねこ シメオン 年末カウントダウン♪
    'c106' => 'まんぼう',  # c106  まんぼう ワンダ 年末カウントダウン♪
    'c107' => 'いぼいのしし',  # c107  いぼいのしし イヴォン 年末カウントダウン♪
    'c108' => 'ぶろっこりー',  # c108  ぶろっこりー ブローリン 年末カウントダウン♪
    'c109' => 'しろちゃとら',  # c109  しろちゃとら ラディスラヴァ 年末カウントダウン♪
    'c11' => 'みけ',  # c11  みけ カルヴィン 
    'c13' => 'かたつむり',  # c13  かたつむり ロミオ 
    'c14' => 'くらげ',  # c14  くらげ レティーシャ 
    'c15' => 'しゃち',  # c15  しゃち ウェーズリー 
    'c16' => 'あふりかぞう',  # c16  あふりかぞう マリアンヌ 
    'c17' => 'おらうーたん',  # c17  おらうーたん ユリシーズ 
    'c18' => 'かまきり',  # c18  かまきり エマ 
    'c19' => 'あげはちょう',  # c19  あげはちょう タバサ 
    'c20' => 'とら',  # c20  とら グロリア 
    'c21' => 'おおたこ',  # c21  おおたこ ニール 
    'c22' => 'うちゅうせん',  # c22  うちゅうせん ワット 
    'c23' => 'ぱんだ',  # c23  ぱんだ チャールズ 
    'c24' => 'ぶるどっぐ',  # c24  ぶるどっぐ ナタリア 
    'c25' => 'うし',  # c25  うし ルーカス 
    'c26' => 'えりまきとかげ',  # c26  えりまきとかげ モニカ 
    'c27' => 'ひつじ',  # c27  ひつじ リンダ 
    'c28' => 'うさぎ',  # c28  うさぎ ケイト 
    'c29' => 'しまうま',  # c29  しまうま イアン 
    'c30' => 'おうむ',  # c30  おうむ フィリップ 
    'c31' => 'かえる',  # c31  かえる ネル 
    'c32' => 'きんぎょ',  # c32  きんぎょ オスカー 
    'c33' => 'ねったいぎょ',  # c33  ねったいぎょ ホリー 
    'c34' => 'すなねずみ',  # c34  すなねずみ トニー 
    'c35' => 'ごりら',  # c35  ごりら ダン 
    'c36' => 'さらぶれっど',  # c36  さらぶれっど ミッシェル 
    'c37' => 'ぺるしゃ',  # c37  ぺるしゃ セシル 
    'c38' => 'だいおういか',  # c38  だいおういか コリーン 
    'c39' => 'もみのき',  # c39  もみのき シビル 
    'c40' => 'らいおん',  # c40  らいおん ハワード 
    'c41' => 'ろぶすたー',  # c41  ろぶすたー ヤニク 
    'c42' => 'みつりょうしゃ',  # c42  みつりょうしゃ ラルフ 
    'c43' => 'くまー',  # c43  くまー ガストン 
    'c44' => 'いわとびぺんぎん',  # c44  いわとびぺんぎん ドナルド 
    'c45' => 'はいえな',  # c45  はいえな プリシラ 
    'c46' => 'あらいぐま',  # c46  あらいぐま ゲイル 
    'c47' => 'しろまどうし',  # c47  しろまどうし ペラジー 
    'c48' => 'くじゃく',  # c48  くじゃく ビアンカ 
    'c49' => 'にほんざる',  # c49  にほんざる ボリス 
    'c50' => 'きつね',  # c50  きつね ディーン 
    'c51' => 'かげろう',  # c51  かげろう ヨーランダ 
    'c52' => 'ありじごく',  # c52  ありじごく ギリアン 
    'c53' => 'やみふくろう',  # c53  やみふくろう ゼルダ 
    'c54' => 'さめ',  # c54  さめ ザック 
    'c55' => 'もるふぉちょう',  # c55  もるふぉちょう パピヨン 
    'c56' => 'ぶた',  # c56  ぶた ゴドウィン 
    'c57' => 'らくだ',  # c57  らくだ ツェツィーリヤ 
    'c58' => 'ゆにこーん',  # c58  ゆにこーん ブルーノ 
    'c59' => 'れとりばー',  # c59  れとりばー ムパムピス 
    'c60' => 'はむすたー',  # c60  はむすたー ポーチュラカ 
    'c61' => 'すっぽん',  # c61  すっぽん ヌマタロウ 
    'c62' => 'きつねりす',  # c62  きつねりす ヴェラ 
    'c63' => 'おこじょ',  # c63  おこじょ ピッパ 
    'c64' => 'やまあらし',  # c64  やまあらし ヘクター 
    'c65' => 'ちすいこうもり',  # c65  ちすいこうもり ズリエル 
    'c66' => 'ばいにん',  # c66  ばいにん クリストファー 
    'c67' => 'りす',  # c67  りす ソ\フィア 
    'c68' => 'なまこ',  # c68  なまこ ヨアヒム 
    'c69' => 'びーる',  # c69  びーる ギネス 
    'c70' => 'かんがるー',  # c70  かんがるー パティ 
    'c71' => 'なまけもの',  # c71  なまけもの ノックス 
    'c72' => 'ほたる',  # c72  ほたる ヴェスパタイン 
    'c73' => 'くりおね',  # c73  くりおね ローズマリー 
    'c74' => 'はいびすかす',  # c74  はいびすかす フランシスカ 
    'c75' => 'いえてぃ',  # c75  いえてぃ ビリー 
    'c76' => 'めがねざる',  # c76  めがねざる ジョージ 
    'c77' => 'にんじん',  # c77  にんじん キャロライナ 
    'c78' => 'かめれおん',  # c78  かめれおん ネイサン 
    'c79' => 'わかめ',  # c79  わかめ マーゴ 
    'c80' => 'りかおん',  # c80  りかおん テッド 
    'c81' => 'ふぇねっく',  # c81  ふぇねっく サイラス 
    'c82' => 'どぶねずみ',  # c82  どぶねずみ ロビン 
    'c83' => 'いそぎんちゃく',  # c83  いそぎんちゃく アイリス 
    'c84' => 'しろへび',  # c84  しろへび ブレンダ 2011/12/05
    'c85' => 'かみつきがめ',  # c85  かみつきがめ ハナ 2011/12/05
    'c86' => 'かも',  # c86  かも ホレーショー 2011/12/05
    'c87' => 'りゅう',  # c87  りゅう エリアス 2011/12/05
    'c88' => 'ゆでたまご',  # c88  ゆでたまご ピエール 2011/12/05
    'c89' => 'かば',  # c89  かば カトリーナ 2011/12/06
    'c90' => 'さい',  # c90  さい ケヴィン 2011/12/06
    'c91' => 'あるぱか',  # c91  あるぱか ドロシー 2011/12/06 姦しい奥様♪
    'c92' => 'さば',  # c92  さば セレスト 2011/12/06 姦し娘ーず♪
    'c93' => 'わらいかわせみ',  # c93  わらいかわせみ ベッキー 2011/12/06 えー○○が許されるのは小学生までだよねー♪
    'c94' => 'あかまむし',  # c94  あかまむし ダーラ 2011/12/11
    'c95' => 'やもり',  # c95  やもり モリス 2011/12/11
    'c96' => 'せあかごけぐも',  # c96  せあかごけぐも レオナルド 2011/12/11
    'c97' => 'しぇぱーど',  # c97  しぇぱーど ジェフ 2011/12/14 超常現象はあるんだ…
    'c98' => 'はしびろこう',  # c98  はしびろこう オズワルド 2011/12/29 この髭はぜったいワックス使ってる。
    'c99' => 'しんかいぎょ',  # c99  しんかいぎょ サイモン 
    'r12' => 'うえきばち',  # r12  うえきばち バーナバス 
    $maker => '草原のざわめき',
    $admin => '大地の震動',
  );

  # キャラの名前
  my %chrname = (
    'c01' => 'メアリー',   # c01  こじか メアリー 
    'c02' => 'アルフレッド',   # c02  よーくしゃーてりあ アルフレッド 
    'c03' => 'スティーブン',   # c03  かもすぞ スティーブン 
    'c04' => 'ノーリーン',   # c04  くろひょう ノーリーン 
    'c05' => 'キャサリン',   # c05  いとまきえい キャサリン 
    'c07' => 'ティモシー',   # c07  てのりぶんちょう ティモシー 
    'c08' => 'ベネット',   # c08  たぬき ベネット 
    'c09' => 'ヒロシ',   # c09  にほんおおかみ ヒロシ 
    'c10' => 'ゾーイ',   # c10  そまり ゾーイ 
    'c100' => 'グレッグ',   # c100  びーばー グレッグ 2012/12/30 スポーツ系中学生くらいに見える
    'c101' => 'クラリッサ',   # c101  すずらん クラリッサ 2011/12/30 美人さん♪
    'c102' => 'ウォーレン',   # c102  さんた ウォーレン 年末カウントダウン♪
    'c103' => 'ナンシー',   # c103  おうむがい ナンシー 年末カウントダウン♪
    'c104' => 'ヒュー',   # c104  みいら ヒュー 年末カウントダウン♪
    'c105' => 'シメオン',   # c105  うみねこ シメオン 年末カウントダウン♪
    'c106' => 'ワンダ',   # c106  まんぼう ワンダ 年末カウントダウン♪
    'c107' => 'イヴォン',   # c107  いぼいのしし イヴォン 年末カウントダウン♪
    'c108' => 'ブローリン',   # c108  ぶろっこりー ブローリン 年末カウントダウン♪
    'c109' => 'ラディスラヴァ',   # c109  しろちゃとら ラディスラヴァ 年末カウントダウン♪
    'c11' => 'カルヴィン',   # c11  みけ カルヴィン 
    'c13' => 'ロミオ',   # c13  かたつむり ロミオ 
    'c14' => 'レティーシャ',   # c14  くらげ レティーシャ 
    'c15' => 'ウェーズリー',   # c15  しゃち ウェーズリー 
    'c16' => 'マリアンヌ',   # c16  あふりかぞう マリアンヌ 
    'c17' => 'ユリシーズ',   # c17  おらうーたん ユリシーズ 
    'c18' => 'エマ',   # c18  かまきり エマ 
    'c19' => 'タバサ',   # c19  あげはちょう タバサ 
    'c20' => 'グロリア',   # c20  とら グロリア 
    'c21' => 'ニール',   # c21  おおたこ ニール 
    'c22' => 'ワット',   # c22  うちゅうせん ワット 
    'c23' => 'チャールズ',   # c23  ぱんだ チャールズ 
    'c24' => 'ナタリア',   # c24  ぶるどっぐ ナタリア 
    'c25' => 'ルーカス',   # c25  うし ルーカス 
    'c26' => 'モニカ',   # c26  えりまきとかげ モニカ 
    'c27' => 'リンダ',   # c27  ひつじ リンダ 
    'c28' => 'ケイト',   # c28  うさぎ ケイト 
    'c29' => 'イアン',   # c29  しまうま イアン 
    'c30' => 'フィリップ',   # c30  おうむ フィリップ 
    'c31' => 'ネル',   # c31  かえる ネル 
    'c32' => 'オスカー',   # c32  きんぎょ オスカー 
    'c33' => 'ホリー',   # c33  ねったいぎょ ホリー 
    'c34' => 'トニー',   # c34  すなねずみ トニー 
    'c35' => 'ダン',   # c35  ごりら ダン 
    'c36' => 'ミッシェル',   # c36  さらぶれっど ミッシェル 
    'c37' => 'セシル',   # c37  ぺるしゃ セシル 
    'c38' => 'コリーン',   # c38  だいおういか コリーン 
    'c39' => 'シビル',   # c39  もみのき シビル 
    'c40' => 'ハワード',   # c40  らいおん ハワード 
    'c41' => 'ヤニク',   # c41  ろぶすたー ヤニク 
    'c42' => 'ラルフ',   # c42  みつりょうしゃ ラルフ 
    'c43' => 'ガストン',   # c43  くまー ガストン 
    'c44' => 'ドナルド',   # c44  いわとびぺんぎん ドナルド 
    'c45' => 'プリシラ',   # c45  はいえな プリシラ 
    'c46' => 'ゲイル',   # c46  あらいぐま ゲイル 
    'c47' => 'ペラジー',   # c47  しろまどうし ペラジー 
    'c48' => 'ビアンカ',   # c48  くじゃく ビアンカ 
    'c49' => 'ボリス',   # c49  にほんざる ボリス 
    'c50' => 'ディーン',   # c50  きつね ディーン 
    'c51' => 'ヨーランダ',   # c51  かげろう ヨーランダ 
    'c52' => 'ギリアン',   # c52  ありじごく ギリアン 
    'c53' => 'ゼルダ',   # c53  やみふくろう ゼルダ 
    'c54' => 'ザック',   # c54  さめ ザック 
    'c55' => 'パピヨン',   # c55  もるふぉちょう パピヨン 
    'c56' => 'ゴドウィン',   # c56  ぶた ゴドウィン 
    'c57' => 'ツェツィーリヤ',   # c57  らくだ ツェツィーリヤ 
    'c58' => 'ブルーノ',   # c58  ゆにこーん ブルーノ 
    'c59' => 'ムパムピス',   # c59  れとりばー ムパムピス 
    'c60' => 'ポーチュラカ',   # c60  はむすたー ポーチュラカ 
    'c61' => 'ヌマタロウ',   # c61  すっぽん ヌマタロウ 
    'c62' => 'ヴェラ',   # c62  きつねりす ヴェラ 
    'c63' => 'ピッパ',   # c63  おこじょ ピッパ 
    'c64' => 'ヘクター',   # c64  やまあらし ヘクター 
    'c65' => 'ズリエル',   # c65  ちすいこうもり ズリエル 
    'c66' => 'クリストファー',   # c66  ばいにん クリストファー 
    'c67' => 'ソ\フィア',   # c67  りす ソ\フィア 
    'c68' => 'ヨアヒム',   # c68  なまこ ヨアヒム 
    'c69' => 'ギネス',   # c69  びーる ギネス 
    'c70' => 'パティ',   # c70  かんがるー パティ 
    'c71' => 'ノックス',   # c71  なまけもの ノックス 
    'c72' => 'ヴェスパタイン',   # c72  ほたる ヴェスパタイン 
    'c73' => 'ローズマリー',   # c73  くりおね ローズマリー 
    'c74' => 'フランシスカ',   # c74  はいびすかす フランシスカ 
    'c75' => 'ビリー',   # c75  いえてぃ ビリー 
    'c76' => 'ジョージ',   # c76  めがねざる ジョージ 
    'c77' => 'キャロライナ',   # c77  にんじん キャロライナ 
    'c78' => 'ネイサン',   # c78  かめれおん ネイサン 
    'c79' => 'マーゴ',   # c79  わかめ マーゴ 
    'c80' => 'テッド',   # c80  りかおん テッド 
    'c81' => 'サイラス',   # c81  ふぇねっく サイラス 
    'c82' => 'ロビン',   # c82  どぶねずみ ロビン 
    'c83' => 'アイリス',   # c83  いそぎんちゃく アイリス 
    'c84' => 'ブレンダ',   # c84  しろへび ブレンダ 2011/12/05
    'c85' => 'ハナ',   # c85  かみつきがめ ハナ 2011/12/05
    'c86' => 'ホレーショー',   # c86  かも ホレーショー 2011/12/05
    'c87' => 'エリアス',   # c87  りゅう エリアス 2011/12/05
    'c88' => 'ピエール',   # c88  ゆでたまご ピエール 2011/12/05
    'c89' => 'カトリーナ',   # c89  かば カトリーナ 2011/12/06
    'c90' => 'ケヴィン',   # c90  さい ケヴィン 2011/12/06
    'c91' => 'ドロシー',   # c91  あるぱか ドロシー 2011/12/06 姦しい奥様♪
    'c92' => 'セレスト',   # c92  さば セレスト 2011/12/06 姦し娘ーず♪
    'c93' => 'ベッキー',   # c93  わらいかわせみ ベッキー 2011/12/06 えー○○が許されるのは小学生までだよねー♪
    'c94' => 'ダーラ',   # c94  あかまむし ダーラ 2011/12/11
    'c95' => 'モリス',   # c95  やもり モリス 2011/12/11
    'c96' => 'レオナルド',   # c96  せあかごけぐも レオナルド 2011/12/11
    'c97' => 'ジェフ',   # c97  しぇぱーど ジェフ 2011/12/14 超常現象はあるんだ…
    'c98' => 'オズワルド',   # c98  はしびろこう オズワルド 2011/12/29 この髭はぜったいワックス使ってる。
    'c99' => 'サイモン',   # c99  しんかいぎょ サイモン 
    'r12' => 'バーナバス',   # r12  うえきばち バーナバス 
    $maker    => '（村建て人）',
    $admin    => '（管理人）',
  );

  # ダミーキャラの発言
  my @npcsay =(
    "嗚呼、聞こえる。やつの足音が聞こえる……。",
    "逃げろ。逃げろ！おまえらだけでも逃げろ。",
  );

  my @expression = (
  );

  my %charset = (
    CAPTION        => 'うきうきサバンナ',
    NPCID          => 'c99',
    CHRNAME        => \%chrname,
    CHRJOB         => \%chrjob,
    ORDER          => \@order,
    NPCSAY         => \@npcsay,
    IMGFACEW       => 90,
    IMGFACEH       => 130,
    IMGBODYW       => 90,
    IMGBODYH       => 130,
    DIR            => "$sow->{'cfg'}->{'DIR_IMG'}/portrate/",
    EXT            => '.jpg',
    BODY           => '',
    FACE           => '',
    GRAVE          => '',
    EXPRESSION     => \@expression,
    LAYOUT_NAME    => 'right',
  );

  return \%charset;
}

1;
