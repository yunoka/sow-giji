package SWTextRS_millerhollow;

sub GetTextRS {
	# プロローグ〜二日目の開始時メッセージ
	my @announce_first = (
		'昼間は人間のふりをして、夜に正体を現すという人狼。<br>その人狼が、この村に紛れ込んでいるという噂が広がった。<br><br>村人達は半信半疑ながらも、村はずれの宿に集められることになった。',
		'さあ、自らの姿を鏡に映してみよう。<br>そこに映るのはただの村人か、それとも血に飢えた人狼か。<br><br>例え人狼でも、多人数で立ち向かえば怖くはない。<br>問題は、だれが人狼なのかという事だ。<br>予言者の能力を持つ人間ならば、それを見破れるだろう。',
		'ついに犠牲者が出た。人狼はこの村人達のなかにいる。<br>しかし、それを見分ける手段はない。<br><br>村人達は、疑わしい者を排除するため、投票を行う事にした。<br>無実の犠牲者が出るのもやむをえない。村が全滅するよりは……。<br><br>最後まで残るのは村人か、それとも人狼か。',
	);

	# 役職配分のお知らせ
	my @announce_role = (
		'どうやらこの中には、_ROLE_いるようだ。',
		'が',
		'名',
		'、',
	);

	# 生存者のお知らせ
	my @announce_lives = (
		'現在の生存者は、',
		'、',
		'の<b>_LIVES_名</b>。',
	);

	# 処刑時のお知らせ
	my @announce_vote =(
		'<b>_NAME_</b>は<b>_TARGET_</b>に投票した。_RANDOM_',
		'<b>_NAME_</b>に<b>_COUNT_人</b>が投票した。',
		'<b>_NAME_</b>は村人達の手により処刑された。',
		'<b>_NAME_</b>を処刑するには畏れ多かったので、取りやめた。',
		'<b>_NAME_</b>は村人の手により処刑された。最後に<b>_TARGET_</b>を指差して……。',
	);

   # 襲撃時のお知らせ
   my @announce_selectkill =(
		'',
		'<b>_NAME_</b>に<b>_COUNT_人</b>が牙を向けた。',
		'<b>_NAME_</b> は襲撃された。',
		'',
		'',
	);

	# 優勢側をアナウンス
	my @announce_lead =(
		'村人と人狼の人数が等しく、勢力は拮抗しているようです。',
		'村人が多く、村人陣営が優勢のようです。',
		'人狼が多く、人狼陣営が優勢のようです。',
	);

	# 委任投票のお知らせ
	my @announce_entrust = (
		'<b>_NAME_</b>は投票を委任しています。_RANDOM_',
		'<b>_NAME_</b>は投票を委任しようとしましたが、解決不能でした。_RANDOM_',
	);

	# コミット
	my @announce_commit = (
		'<b>_NAME_</b>が時を進めることを諦めた。',
		'<b>_NAME_</b>は時が進むよう祈った。',
	);

	# コミット状況
	my @announce_totalcommit = (
		'「時間を進める」を選択している人は、まだ少ないようです。', # 0〜1/3の時
		'「時間を進める」を選択している人が増えてきているようです。', # 1/3〜2/3の時
		'多数の人が「時間を進める」を選択していますが、全員ではないようです。', # 2/3〜n-1の時
		'全員が「時間を進める」を選択しています。', # 全員コミット済み
	);

   # 襲撃結果メッセージ
   my @announce_kill = (
		'次の日の朝、村人達は集まり、互いの姿を確認した。',
		'今日は犠牲者がいないようだ。人狼は襲撃に失敗したのだろうか。',
		'<b>_TARGET_</b>が無残な姿で発見された。',
   );

	my %status_live = (
		live       =>  '生存者',
		executed   =>  '処刑死',
		victim     =>  '襲撃死',
		cursed     =>  '呪詛死',
		droop      =>  '衰退死',
		suicide    =>  '後追死',
		feared     =>  '恐怖死',
		suddendead =>  '突然死',
	);

	# 勝敗メッセージ
	my @announce_winner = (
		'次の日の朝、住人全てが忽然と姿を消した。',
		'全ての人狼を退治した……。人狼に怯える日々は去ったのだ！',
		'もう人狼に抵抗できるほど村人は残っていない……。<br>人狼は残った村人を全て食らい、別の獲物を求めてこの村を去っていった。',
		'村人達は気付いてしまった。もう疑いあう必要なんてないことに。<br>人も狼も関係ない、夢のような生活が始まる…',
		'全ての人狼を退治した……。<br>だが、勝利に沸き立つ人々は、妖精という真の勝利者に、最後まで気付くことはなかった……',
		'その時、人狼は勝利を確信し、そして初めて過ちに気づいた。<br>しかし、天敵たる妖精を討ち漏らした人狼には、最早なすすべがなかった……',
		'',
		'村人も、人狼も、妖精でさえも、恋人たちの前では無力でした。<br>必ず最後に愛は勝つのです。',
		'',
		'次の日の朝、住人の姿はひとつも残っていなかった。',
	);

	# 勝利者
	my @caption_winner = (
		'',
		'村人の勝利',
		'人狼の勝利',
		'笛吹き勝利',
		'',
		'',
		'',
		'恋人達の勝利',
		'',
		'勝利者なし',
	);

	my %role_win = (
		WIN_NONE     => '--',
		WIN_DISH     => '据え膳',
		WIN_LOVER    => '恋人陣営',
		WIN_HATER    => '邪気陣営',
		WIN_LONEWOLF => '一匹狼',
		WIN_HUMAN    => '村人陣営',
		WIN_WOLF     => '人狼陣営',
		WIN_PIXI     => '妖精',
		WIN_GURU     => '笛吹き',
		WIN_EVIL     => '裏切りの陣営',
	);

    # イベント名
    my @eventname = (
        '', '普通の日', '四月馬鹿', '二重スパイ', ''    , '日蝕', 'Sir Cointoss', '影響力', '奇跡', '聖者のお告げ',
        '', '不満'    , '熱意'    , '悪夢'      , '亡霊', '逃亡（未実装）', '降霊会'      , ''      , ''    , ''            ,
    );

   my @explain_event = (
'未定義のイベントです。',
'今日は、特別なことのない一日のようだ。さあ普段通り、誰かを処刑台にかけよう。',
'<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Event)EVENTID_APRIL_FOOL" TARGET="_blank">四月馬鹿</A></b><br>大変、大変、大変なことになった。きみの役職は変化しているかもしれない。もしも誰かと絆を結んでいるなら、急に相手が憎くなってしまい、絆の相手だけにしか投票できない。そして悟ってしまった。今夜だけは、相方の後を追うことはないと……。<br><table><tr><th colspan=3>役職の変貌<th rowspan=4>※一日で元に戻る<tr><td>預言者<td>←→<td>魔女<tr><td>守護者<td>←→<td>長老<tr><td>狩人<td>←→<td>少女</table>',
'<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Event)EVENTID_TURN_FINK" TARGET="_blank">二重スパイ</A></b><br>なんということだろう！一人が村側を裏切り、狼に与する半端者になってしまった。明日以降も、彼は村人を裏切り続けるだろう……。<br>保安官や光の輪の持ち主なら、このときにその力を手放してしまう。',
'<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Event)EVENTID_TURN_FAIRY" TARGET="_blank">妖精の輪</A></b><br>なんということだろう！一人が森に立ち入り、妖精の養子になってしまった。明日以降も、彼は村人を裏切り続けるだろう……。<br>保安官や光の輪の持ち主なら、このときにその力を手放してしまう。',
'<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Event)EVENTID_ECLIPSE" TARGET="_blank">日蝕</A></b><br>暗い日蝕が村中を覆い、お互い顔も名前も解らない。この闇夜は丸一日続くだろう。他人になりすまし、議論を混乱させることもできてしまうかもしれない。',
'<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Event)EVENTID_COINTOSS" TARGET="_blank">Sir Cointoss</A></b><br>お控えなさい。お控えなさい。コイントス卿はこの村の投票結果に意見があるようでございます。卿の御意向によっては、投票結果に基づいた処刑を取り止めにすることもあります。五分五分くらいかな。',
'<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Event)EVENTID_FORCE" TARGET="_blank">影響力</A></b><br>今日の投票箱は無色透明だ。だれかが投票した瞬間にその内容はハッキリと見えるから、投票をセットするときは気を付けて！',
'<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Event)EVENTID_MIRACLE" TARGET="_blank">奇跡</A></b><br>帰ってきた！黄泉の国から襲撃による犠牲者達がかえってきた！能力を失ったかもしれないけれど、それは些細なことだよ！ね！<br>人狼、一匹狼、賞金稼ぎなどに襲われた死者は生き返る。ただし、復活者が村人陣営なら、その能力は失われる。',
'<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Event)EVENTID_PROPHECY" TARGET="_blank">聖者のお告げ</A></b><br>聖者は民の夢枕に告げられました。今の任より、<b>保安官</A></b>にふさわしい人物がいると。旧き任務は解かれ、あたらしい<b>保安官</A></b>は皆に喝采で迎え入れられるだろう。',

'未定義のイベントです。',
'<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Event)EVENTID_CLAMOR" TARGET="_blank">不満</A></b><br>村には不満が鬱屈している。今夜の投票でまた人間を処刑してしまったら……悪夢が始まる。はじけた不満に背中を押され、話し合いもなしに、さらに一人の首を必要とするだろう。',
'<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Event)EVENTID_FIRE" TARGET="_blank">熱意</A></b><br>村には期待に満ちた熱意が渦巻いている。今夜の投票がひとならぬものを処刑できたなら……悪夢が始まるのだ。はじけた熱意に背中を押され、話し合いもなしに、さらに一人の首を必要とするだろう。',
'<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Event)EVENTID_NIGHTMARE" TARGET="_blank">悪夢</A></b><br>恐ろしい一日が始まる。今日は投票だけができる。発言も、能力も使えない。そして、突然死は発生しない。<br>さあ投票して、こんな日が早く過ぎ去ってしまうよう、ひとり祈りを捧げよう。',
'<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Event)EVENTID_GHOST" TARGET="_blank">亡霊</A></b><br>今夜、人狼に殺された人は人狼になる。また、襲撃を実行した人狼は命を落としてしまうだろう。人狼となった者は報復行動を行わない。ただし、命拾いをしたならば人狼にはならない。<br>一匹狼は亡霊を作らない。',
'<b>逃亡</b><br>せめて一人だけでも、なんとかして逃がそう。今夜の投票で逃亡者を一人決め、夜中の処刑のかわりに密かに逃がすのだ。<br>しかし逃亡者は一日のあいだ逃亡生活を続け、ついに村へと帰還してしまう。帰還者の票は通常の三倍尊重されるだろう。実装がめんどうだから、このまま未定義にしておこうかな。',
'<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Event)EVENTID_SEANSE" TARGET="_blank">降霊会</A></b><br>こっくりさん、こっくりさん……<br>秘密の儀式で、墓場の霊魂がかえってきた。今日に限り、生者も姿の見えぬ死者も屋根を共にし、議論するだろう。',

'未定義のイベントです。',
'未定義のイベントです。',
'未定義のイベントです。',
);

   # アイテム名
   my @giftname = (
      'おまかせ',  'なし',    '喪失',  '感染',  '','光の輪', '半端者', '悪鬼', '妖精の子', '',
      ''        ,'保安官','夢占い師',      '',  '',      '',       '',     '',         '', '',
   );

   # アイテム名（省略時）
   my @giftshortname = (
      '',   '',   '', '', '', '', '', '鬼', '', '',
      '', '決',   '', '', '', '', '',   '', '', '',
   );

   # アイテム用特殊発言欄のラベル
   my @caption_giftsay = (
      '', '', '', '', '', '', '', '囁き', '', '',
      '', '', '', '', '', '', '',     '', '', '',
   );

   # アイテム能力名
   my @abi_gift = (
      '',     '',     '', '', '', '渡す', '', '襲う', '', '',
      '', '投票', '占う', '', '',     '', '',     '', '', '',
   );

	# 役職名
	my @rolename = (
		'おまかせ',	'村人',			'',			'',		'',		'',		'',		'',					'預言者',	'守護者',
		'',			'',				'',			'',		'',		'',		'狩人',	'',					'',			'',
		'',			'',				'',			'',		'',		'魔女',	'少女',	'スケープゴート',	'長老',		'',
		'',			'',				'',			'',		'',		'',		'',		'',					'',			'',
		'',			'',				'',			'',		'',		'',		'',		'',					'',			'',
		'',			'',				'',			'',		'',		'',		'',		'',					'',			'',
		'',			'人狼',			'',			'人狼',	'',		'',		'',		'',					'',			'',
		'',			'',				'',			'',		'',		'',		'',		'',					'',			'',
		'',			'',				'',			'',		'',		'',		'',		'',					'',			'',
		'',			'キューピッド',	'',			'',		'盗賊',	'',		'',		'笛吹き',			'',			'',
	);

	# 役職名（省略時）
	my @roleshortname = (
		'',	'村',	'',		'',		'',		'',		'',		'',		'預',	'守',
		'',	'',		'',		'',		'',		'',		'狩 ',	'',		'',		'',
		'',	'',		'',		'',		'',		'魔',	'少',	'贄',	'老',	'',	
		'',	'',		'',		'',		'',		'',		'',		'',		'',		'',
		'',	'',		'',		'',		'',		'',		'',		'',		'',		'',
		'',	'',		'',		'',		'',		'',		'',		'',		'',		'',
		'',	'',		'',		'狼',	'',		'',		'',		'',		'',		'',	
		'',	'',		'',		'',		'',		'',		'',		'',		'',		'',
		'',	'',		'',		'',		'',		'',		'',		'',		'',		'',	
		'',	'Ｑ',	'',		'',		'盗賊',	'',		'',		'笛',	'',		'',	
	);

   # 能力者用特殊発言欄のラベル
   my @caption_rolesay = (
      '',''    ,''    ,''    ,'共鳴',''    ,''    ,''    ,'','',
      '',''    ,''    ,''    ,''    ,''    ,''    ,''    ,'','',
      '',''    ,''    ,''    ,''    ,''    ,''    ,''    ,'','',
      '','念話','念話','念話',''    ,''    ,''    ,''    ,'','',
      '',''    ,''    ,'憑依','囁き',''    ,''    ,''    ,'','',
      '',''    ,''    ,''    ,''    ,''    ,''    ,''    ,'','',
      '','囁き','囁き','囁き','囁き','囁き','囁き','囁き','','囁き',
      '',''    ,''    ,''    ,''    ,''    ,''    ,''    ,'','',
      '',''    ,''    ,''    ,''    ,''    ,'囁き',''    ,'','',
      '',''    ,''    ,''    ,''    ,''    ,''    ,''    ,'','',
   );

   # 能力名
   my @abi_role = (
      ''    ,''    ,''    ,''    ,''        ,'占う'    ,'占う'  ,'占う'  ,'占う'  ,'守る',   
      ''    ,''    ,''    ,''    ,''        ,''        ,'狙う'  ,''      ,''      ,'',   
      ''    ,''    ,''    ,''    ,'飲薬する','投薬する','夜遊び','疑う'  ,''      ,'',   
      ''    ,'隠す','換る',''    ,''        ,''        ,''      ,''      ,''      ,'',   
      ''    ,''    ,''    ,''    ,''        ,''        ,''      ,''      ,'占う'  ,'',   
      ''    ,''    ,''    ,''    ,''        ,''        ,''      ,''      ,''      ,'',   
      ''    ,'襲う','襲う','襲う','襲う'    ,'襲う'    ,'襲う'  ,'襲う'  ,'襲う'  ,'襲う',   
      ''    ,''    ,''    ,''    ,''        ,''        ,''      ,''      ,''      ,'',   
      ''    ,''    ,''    ,''    ,''        ,''        ,''      ,''      ,''      ,'結ぶ',   
      '結ぶ','結ぶ',''    ,'入門',''        ,'襲う'    ,''      ,'誘う'  ,'跳ねる','',
   );

   # 説明
   my $stat_kill   = '殺害します。ただし、対象が護衛されているか、妖精であれば、効力は発揮しません。また、対象が無傷の長老の場合は、即死はしませんが傷を負わせることができます。';
   my $stat_wolf   = '毎夜、人狼全員で一人だけ、村人を'.$stat_kill.'<br>';
   my $stat_wisper = '人狼同士にしか聞こえない会話が可能です。<br>';
   my $stat_pixi   = '人狼に殺されることがありません。ただし、占いの対象となると死亡します。<br>占い師、霊能者には人間として判別されますが、勝利条件では人間にも人狼にも数えられません。<br>';
   my $stat_enemy  = '人間でありながら、人外に協力する裏切り者です。勝利条件では人間扱いで集計されるため、場合によっては敢えて死ぬ必要があります。';
   my $stat_fm     = '自分以外の結社員・共鳴者が誰か知っています。';
   my $act_seer    = '毎夜、ひとりを占い、その人が';
   my $act_medium  = '無惨な死体について判断することは出来ません。処刑や突然死で死んだ者が';
   my $stat_seer   = 'また、妖精を占うと呪殺することが出来ます。';
   my $know_seer   = '人間か人狼か判別できます。';
   my $know_wisdom = '持つ役職がわかります。';
   my $stat_droop  = 'あなたは、生きた人狼の人数の二日後に、命を落とします。';
   my $stat_angel  = '一日目、好きな二人に“運命の絆”を結びつける事ができます。“運命の絆”を結んだ人は、片方が死亡すると後を追って死亡します。';
   my $stat_other  = 'あなたは、勝利条件では人間として数えられます。';
	
   my @explain_gift = (
'',
'',
'<p>あなたは光の輪を<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Gift)GIFTID_LOST" TARGET="_blank">喪失</A>しました。<br>もう二度と手にすることはないでしょう。もし光の輪があなたの手に渡ったら、光の輪は消え去ってしまいます。そして、あなたがそれに気付くことはないでしょう。</p>',
'<p>恩恵は未定義です。</p>',
'<p>恩恵は未定義です。</p>',
'<p>あなたを<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Gift)GIFTID_SHIELD" TARGET="_blank">光の輪</A>が取り巻きます。<br>あなたはもし昨夜、襲撃されていたとしても守られました。<br>光の輪はひとりを一度しか守りません。もし渡した光の輪がふたたびあなたの手に渡ったら、光の輪は消え去ってしまいます。次に光りに守られるべき良き友を選びましょう。<br>ただし、光の輪を渡した先が人外の者であれば、彼は光を壊してしまいます。</p>',
'<p>恩恵は未定義です。</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Gift)GIFTID_OGRE" TARGET="_blank">悪鬼</A>です。<br>表向きは他の役目を帯びていますが、あなたは人を襲う悪い鬼なのです。<br>'.$stat_wolf.'また、'.$stat_wisper.'</p>',
'<p>恩恵は未定義です。</p>',
'<p>恩恵は未定義です。</p>',
'<p>恩恵は未定義です。</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Gift)GIFTID_DECIDE" TARGET="_blank">保安官</A>です。<br>あなたは追加票を投じる権利を持ちつづけます。行使することで、健在を示すこともできるでしょう。<br>もし光の輪があなたの手に渡ったら、追加票を投じる権利は掻き消えてしまいます。</p>',
   );

   my @explain_role = (
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_VILLAGER" TARGET="_blank">村人</A>です。<br>特殊な能力はもっていません。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_SEERROLE" TARGET="_blank">預言者</A>です。<br>'.$act_seer.$know_wisdom.'<br>'.$stat_seer.'</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_GUARD" TARGET="_blank">守護者</A>です。<br>毎夜、一人を狼の襲撃、もしくは付け狙う狩人の手から守ることが出来ます。<br>自分自身を守ることは出来ません。</p>',

'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_HUNTER" TARGET="_blank">狩人</A>です。<br>毎夜、一人を付け狙います。<br>あなたがどんな理由であれ命を落とすと、あなたは付け狙っていた人物を道連れに、'.$stat_kill.'</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',

'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_WITCH" TARGET="_blank">魔女</A>です。<br>あなたは二日目以降、生きている者に投薬して毒殺するか、死者に投薬して蘇生させます。ただし、毒殺（生者を選ぶ）、蘇生（死者を選ぶ）、はそれぞれ一度ずつだけおこなうことができ、それっきり薬は失われます。薬を使うにはあらかじめ準備するので、もしも投薬する夜に対象が死亡/蘇生したなら、薬は無駄に使われてしまうでしょう。</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_GIRL" TARGET="_blank">少女</A>です。<br>あなたは二日目以降、夜に出歩くことができます。人狼の囁きを誰のものとも判別せず聞いちゃうので、朝になって昨日を振り返ると思い出せることでしょう。顔や名前はわかりませんが。<br>ただしこのとき、もしあなたが人狼の、誰かひとりにでも襲撃される矛先に含まれていると、恐怖のあまり、実際に襲われる犠牲者とは別に死んでしまいます。この死亡を護衛する方法はありません。また、息を引き取るあなたを尻目に、狼達は別の人物を襲撃するでしょう。</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_SCAPEGOAT" TARGET="_blank">スケープゴート</A>です。<br>もし投票数が同数になり処刑する相手が定まらないと、混乱した村人達に処刑されてしまいます。あなたが最後に指差した人は、後悔する村人達に翌日、処刑されるでしょう。皆、そうするより他にないのです。</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_ELDER" TARGET="_blank">長老</A>です。<br>あなたは襲撃されても、一度だけは命が助かります。もしも夜に、それでも命を落としたら、あなたの恨みは犯人を襲います。ひとりの犯人が特定できるのであれば、犯人は特殊能力を失います。</p>',
'<p>あなたは、未定義の役職です。</p>',

'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',

'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',

'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',

'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_WOLF" TARGET="_blank">人狼</A>です。<br>'.$stat_wolf.'また、'.$stat_wisper.'</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_INTWOLF" TARGET="_blank">人狼</A>です。<br>殺害した村人が'.$know_wisdom.'<br>'.$stat_wolf.'また、'.$stat_wisper.'</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',

'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',

'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',

'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_LOVEANGEL" TARGET="_blank">キューピッド</A>です。<br>キューピッドは'.$stat_angel.'<br>結びつけたふたりが生き延びれば、あなたの勝利となります。あなたにその絆が結ばれていない限り、あなた自身の死は勝敗には直接関係しません。<br>また、'.$stat_other.'</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_ROBBER" TARGET="_blank">盗賊</A>です。<br>あなたは、誰もならなかった残り役職をすべて知ります。次の夜、その中から運命の導くままひとつの役職を選び、仮面の役職に成り代わるでしょう。運命は、あなたになにを課すでしょうか？</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_GURU" TARGET="_blank">笛吹き</A>です。<br>笛吹きは毎晩ふたりずつ、好きな人物をひそかに誘い込むことができます。自分自身を誘うことはできません。<br>誘い込まれた当人たちは夜な夜な踊り明かし、そのことを覚えています。しかし、彼らの能力や所属陣営などに変化はありません。<br>また、'.$stat_other.'</p>',
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',

'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは、未定義の役職です。</p>',
   );

	# 役職希望
   my %explain = (
		prologue => 'あなたは_SELROLE_を希望しています。ただし、希望した通りの能力者になれるとは限りません。',
		dead     => 'あなたは死亡しています。',
		mob      => 'あなたは<b>_ROLE_の<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_MOB" TARGET="_blank">見物人</A></b>です。いかなる陣営の人数にも含まれません。',
		epilogue => 'あなたは<b>_ROLE_</b>でした（_SELROLE_を希望）。',
		explain_role  => \@explain_role,
		explain_gift  => \@explain_gift,
	);

	# 投票欄表示
	my @votelabels = (
		'投票',
		'委任',
	);


	# 聖痕者の色
	# 五人揃っている所を見てみたい（おい
	my @stigma_subid = (
		'赤の',
		'青の',
		'黄の',
		'緑の',
		'桃の',
		'白の',
		'銀の',
	);

	# 占い結果
	# ふつうのルールで騙りがかわいそうなので、占い結果に日付は添えない。
	my @result_seer = (
		'<b>_NAME_</b>_RESULT_',
		'は<b>人間</b>のようだ。',
		'は【<b>人狼</b>】のようだ。',
		'は【<b>能力者ではない</b>】ようだ。（村人、人狼、白狼、のいずれか）',
		'は<b>能力者</b>のようだ。',
		'は<b>健康</b>そうだ。',
		'は【<b>感染している</b>】ようなので、治療した。',
		'は<b>_ROLE_</b>のようだ。',
		'を調べることができなかった。',
	);

	# 配分表名称
	my %caption_roletable = (
		millers  => '標準',
		custom   => '自由設定',
	);

	# アクション
	my @actions = (
		'に相づちを打った。',
		'に頷いた。',
		'に首を傾げた。',
		'をじっと見つめた。',
		'を信頼の目で見た。',
		'を怪訝そうに見た。',
		'を不信の目で見た。',
		'を指さした。',
		'をつんつんつついた。',
		'に驚いた。',
		'に困惑した。',
		'にうろたえた。',
		'に怯えた。',
		'に照れた。',
		'にお辞儀をした。',
		'に手を振った。',
		'に微笑んだ。',
		'に拍手した。',
		'を支持した。',
		'を慰めた。',
		'に別れを告げた。',
		'を抱きしめた。',
		'を小一時間問いつめた。',
		'をハリセンで殴った。',
		'にタライを落とした。',
		'への前言を撤回した。',
		'に感謝した。',
	);

	my %textrs = (
		CAPTION => 'ミラーズホロウ',
		HELP    => 'カードゲーム「The Werewolves of Millers Hollow + New Moon」風の役職を楽しめます。ただし、愚か者には対応していません。守護者、笛吹きにすこし違いがあります。',
		FORCE_DEFAULT => 'custom',

		# ダミーキャラの参加表示（○○がやってきました）の有無
		NPCENTRYMES => 1,

		# 公開アナウンス
		ANNOUNCE_EXTENSION  => '定員に達しなかったため、村の更新日時が24時間延長されました。',
		ENTRYMES            => '_NO_人目、<b>_NAME_</b> がやってきました。',
		EXITMES             => '<b>_NAME_</b>が村を出て行きました。',
		SUDDENDEATH         => '<b>_NAME_</b>は突然死した。',
		SUICIDEBONDS        => '<b>_NAME_</b>は絆に引きずられるように<b>_TARGET_</b>の後を追った。',
		SUICIDELOVERS       => '<b>_NAME_</b>は哀しみに暮れて<b>_TARGET_</b>の後を追った。',
		ANNOUNCE_RANDOMVOTE => '(ランダム投票)',
		ANNOUNCE_VICTORY    => '<b>_VICTORY_</b>です！<br>',
		ANNOUNCE_EPILOGUE   => '<b>_AVICTORY_</b>全てのログとユーザー名を公開します。<b>_DATE_</b>まで自由に書き込めますので、今回の感想などをどうぞ。',

		RANDOMENTRUST => '(ランダム委任)',

		# 能力関連
		UNDEFTARGET     => '（パス）',
		RANDOMTARGET    => 'ランダム',
		RANDOMROLE      => 'ランダム', # 役職ランダム希望
		NOSELROLE       => '村の設定が「役職希望無視」のため、全ての役職希望が無視されます。',
		SETRANDOMROLE   => '<b>_NAME_</b>の役職希望が _SELROLE_ に自動決定されました。',
		SETRANDOMTARGET => '<b>_NAME_</b>の<b>_ABILITY_</b>の対象が <b>_TARGET_</b> に自動決定されました。',
		CANCELTARGET    => '<b>_NAME_</b>の<b>_ABILITY_</b>に有効な対象がありませんでした。',
		EXECUTESEER     => '<b>_NAME_</b>は、<b>_TARGET_</b>を占った。',
		EXECUTEKILL     => '<b>_TARGET_</b>！ 今日がお前の命日だ！',
		EXECUTEKILLWITCH=> '<b>_NAME_</b>は<b>_TARGET_</b>を殺害した。',
		EXECUTELIVEWITCH=> '<b>_NAME_</b>は<b>_TARGET_</b>を蘇生させた。',
		EXECUTEGUARD    => '<b>_NAME_</b>は<b>_TARGET_</b>を守っている。',
		EXECUTEJAMM     => '<b>_NAME_</b>は<b>_TARGET_</b>を隠している。',
		EXECUTETRICKSTER=> '<b>_NAME_</b>は<b>_TARGET1_</b>と<b>_TARGET2_</b>の間に運命の絆を結んだ。',
		EXECUTELOVER    => '<b>_NAME_</b>は<b>_TARGET_</b>との間に運命の絆を結んだ。',
		EXECUTEGURU     => '<b>_NAME_</b>は<b>_TARGET_</b>を誘い込んだ。',
		EXECUTESNATCH   => '<b>_NAME_</b>は<b>_TARGET_</b>の姿を奪った。', 
		EXECUTEFAN      => '<b>_NAME_</b>が遺した言葉は、村中を異様な雰囲気に包んだ。', 
		EXECUTECHILDWOLF=> '<b>_NAME_</b>はか細く鳴き、こときれた。', 
		EXECUTEGIRL     => '<b>_NAME_</b>がこっそり遊んでいるようです。',
		EXECUTEGIRLFEAR => '<b>_NAME_</b>は恐ろしいものを見てしまった！',
		EXECUTETHROW    => '<b>_NAME_</b>は<b>_TARGET_</b> に <b>_GIFT_</b> を差し出した。',
		EXECUTELOST     => '<b>_NAME_</b>には、<b>_GIFT_</b> は届かなかった…',
		EXECUTESHIELDBRK=> '<b>_NAME_</b>に光の輪が渡され、人知れず破壊した。',
		RESULT_RIGHTWOLF=> '<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_RIGHTWOLF" TARGET="_blank">人狼の血族</A>だったようだ。<br>（狼血族のあなたは、占い師、霊能者に人狼と判定されます。ですが、あなたは村人で、勝利条件も変わりません。勝利を目指して頑張りましょう。）',
		RESULT_MEMBER   => '<b>_NAME_</b>から<b>_RESULT_</b>の気配を感じた。',
		RESULT_FANATIC  => '<b>_NAME_</b>から<b>人狼</b>の気配を感じた。',
		RESULT_BAT      => '<b>_NAME_</b>から<b>妖精</b>の気配を感じた。',
		RESULT_GUARD    => '<b>_DATE_日目</b>の夜、<b>_TARGET_</b>を襲撃から守った。',
		RESULT_JAMM     => '<b>_DATE_日目</b>の夜、<b>_TARGET_</b>の正体を占い師から隠した。',
		RESULT_TRICKSTER=> '<b>_DATE_日目</b>の夜、<b>_TARGET1_</b>と<b>_TARGET2_</b>の間に運命の絆を結んだ。',
		RESULT_ZOMBIE   => '<b>_DATE_日目</b>の夜、<b>_TARGET_</b>を<b>感染</b>させた。',
		RESULT_KILL     => '<b>_DATE_日目</b>の夜、<b>_TARGET_</b>を<b>殺害</b>した。',
		RESULT_LIVE     => '<b>_DATE_日目</b>の夜、<b>_TARGET_</b>を<b>蘇生</b>した。',
		RESULT_ALCHEMIST=> '<b>_DATE_日目</b>の夜、秘薬を飲み下した。',
		RESULT_ELDER    => '<b>_DATE_日目</b>の夜、傷を負った。', 
		RESULT_WEREDOG  => '<b>_DATE_日目</b>の夜、傷を負った。あと１日の命だ。', 
		RESULT_SEMIWOLF => '<b>_DATE_日目</b>の夜、人狼に変身した。',
		RESULT_LOVER    => '<b>_DATE_日目</b>の夜、<b>あなた</b>は<b>_TARGET_</b>と運命を分かち合いました。',
		RESULT_LOVEE    => '<b>_DATE_日目</b>の夜、<b>_NAME_</b>が<b>あなた</b>と運命を分かち合いました。',
		RESULT_ROBBER   => 'あなたは盗賊だ。<br>_ROLE_、から選び仮面を纏う。',
		RESULT_DYING    => 'あなたは、もし人狼が<b>_NUMBER_名</b>なら今夜命を落とす。',
		RESULT_GURU     => '<b>_DATE_日目</b>の夜、_TARGET_を誘い込んだ。',
		RESULT_THROW    => '<b>_DATE_日目</b>の夜、<b>_TARGET_</b>に<b>_GIFT_</b>を差し出した。',
		RESULT_SCAPEGOAT=> '処刑場の騒動にもかかわらず<b>_TARGET_</b>は息を引き取った。だれも死者を咎めはしなかった。',
		RESULT_ENCOUNT  => '<b>_DATE_日目</b>の夜、不審な姿を見かけた。',

		STATE_SHEEPS   => ' 踊り狂ったおぼろげな記憶がある。',
		STATE_BONDS    => 'あなたは<b>_TARGET_</b>と運命の絆を結んでいます。',
		STATE_BIND      => 'あなたはもう特殊能力を使うことができません。',
		STATE_BIND_ROLE => 'あなたはもう役職能力を使うことができません。',
		STATE_BIND_GIFT => 'あなたはもう恩恵能力を使うことができません。',

		WIN_HUMAN       => '<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Text)WIN_HUMAN" TARGET="_blank">村人陣営</A></b><br>村人の数が人狼以下になるまでに人狼と妖精が全滅すれば勝利です。<br>ただし、最後まで妖精、もしくは恋人が生き残っていると敗北になります。',
		WIN_WOLF        => '<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Text)WIN_WOLF" TARGET="_blank">人狼陣営</A></b><br>村人(妖精を除く)の数を人狼と同数以下まで減らせば勝利です。<br>ただし、最後まで妖精、もしくは恋人が生き残っていると敗北になります。<br>光の輪が渡されると、知られぬように破壊します。',
		WIN_LONEWOLF    => '<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Text)WIN_LONEWOLF" TARGET="_blank">一匹狼陣営</A></b><br>人狼陣営の狼が生きておらず、村人(妖精を除く)の数を一匹狼と同数以下まで減らせば勝利です。<br>ただし、最後まで妖精、もしくは恋人が生き残っていると敗北になります。<br>光の輪が渡されると、知られぬように破壊します。',
		WIN_PIXI        => '<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Text)WIN_PIXI" TARGET="_blank">妖精陣営</A></b><br>人狼が全滅するか、村人(妖精を除く)の数が人狼と同数以下まで減るまで「生き残れば」勝利です。または、生存者が笛吹きに誘われた者だけになれば勝利です。<br>ただし、最後まで恋人が生き残っていると敗北になります。<br>光の輪が渡されると、知られぬように破壊します。',
		WIN_LOVER       => '<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Text)WIN_LOVER" TARGET="_blank">恋人陣営</A></b><br>いずこかの陣営が勝利を手にしたとき、恋人達が生存していれば勝利です。ただし、ひとりだけ蘇生したなどの不幸で、恋を成就できない恋人は、勝利しません。',
		WIN_EVIL        => '<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Text)WIN_EVIL TARGET="_blank">裏切りの陣営</A></b><br>村人が敗北すれば勝利です。<br>ただし、恋人が勝利した場合は敗北します。あなたと勝利をともにする陣営は、ひとつだけではないかもしれません。',
		WIN_GURU        => '<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Text)WIN_GURU" TARGET="_blank">笛吹き</A></b><br>笛吹き以外の生存者が勧誘された者だけになれば勝利となります。笛吹き自身は、最終的に生き残っていなくとも構いません。<br>ただし、横から勝利を掻っ攫うもの達が存在します。',
		MARK_BONDS      => '絆',

		# アクション関連
		ACTIONS_ADDPT     => 'に話の続きを促した。_REST_',
		ACTIONS_RESTADDPT => '(残_POINT_回)',
		ACTIONS_BOOKMARK  => 'ここまで読んだ。',

		# 操作ログ関連
		ANNOUNCE_SELROLE    => '<b>_NAME_</b>は_SELROLE_ を希望しました（他の人には見えません）。',
		ANNOUNCE_SETVOTE    => '<b>_NAME_</b>は<b>_TARGET_</b>を投票先に選びました。',
		ANNOUNCE_SETENTRUST => '投票を委任します。<br><br><b>_NAME_</b>は<b>_TARGET_</b>に投票を委任しました。',
		ANNOUNCE_SETTARGET  => '<b>_NAME_</b>は<b>_TARGET_</b>を<b>_ABILITY_</b>の対象に選びました。',

		# ボタンのラベル
		BUTTONLABEL_PC  => '_BUTTON_ / 更新',
		BUTTONLABEL_MB  => '_BUTTON_',
		CAPTION_SAY_PC  => '発言',
		CAPTION_SAY_MB  => '発言',
		CAPTION_TSAY_PC => '独り言',
		CAPTION_TSAY_MB => '独り言',
		CAPTION_GSAY_PC => '死者のうめき',
		CAPTION_GSAY_MB => 'うめき',
		CAPTION_ROLESAY => \@caption_rolesay,
		CAPTION_GIFTSAY => \@caption_giftsay,

		ANNOUNCE_WINNER      => \@announce_winner,
		ANNOUNCE_FIRST       => \@announce_first,
		ANNOUNCE_ROLE        => \@announce_role,
		ANNOUNCE_LIVES       => \@announce_lives,
		ANNOUNCE_VOTE        => \@announce_vote,
		ANNOUNCE_SELECTKILL  => \@announce_selectkill,
		ANNOUNCE_COMMIT      => \@announce_commit,
		ANNOUNCE_TOTALCOMMIT => \@announce_totalcommit,
		ANNOUNCE_ENTRUST     => \@announce_entrust,
		ANNOUNCE_KILL        => \@announce_kill,
		ANNOUNCE_LEAD        => \@announce_lead,
		STATUS_LIVE          => \%status_live,
		CAPTION_WINNER       => \@caption_winner,
		EVENTNAME            => \@eventname,
		EXPLAIN_EVENT        => \@explain_event,
		ROLEWIN              => \%role_win,
		ROLENAME             => \@rolename,
		ROLESHORTNAME        => \@roleshortname,
		GIFTNAME             => \@giftname,
		GIFTSHORTNAME        => \@giftshortname,
		ABI_ROLE             => \@abi_role,
		ABI_GIFT             => \@abi_gift,
		EXPLAIN              => \%explain,
		STIGMA_SUBID         => \@stigma_subid,
		RESULT_SEER          => \@result_seer,
		CAPTION_ROLETABLE    => \%caption_roletable,
		VOTELABELS           => \@votelabels,
		ACTIONS              => \@actions,
	);
	return \%textrs;
}

1;
