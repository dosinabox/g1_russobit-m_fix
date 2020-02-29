
instance DIA_BAALTARAN_EXIT(C_INFO)
{
	npc = nov_1331_baaltaran;
	nr = 999;
	condition = dia_baaltaran_exit_condition;
	information = dia_baaltaran_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_baaltaran_exit_condition()
{
	return 1;
};

func void dia_baaltaran_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAALTARAN_GREET(C_INFO)
{
	npc = nov_1331_baaltaran;
	nr = 1;
	condition = dia_baaltaran_greet_condition;
	information = dia_baaltaran_greet_info;
	permanent = 0;
	description = "Я новенький. Кто ты?";
};


func int dia_baaltaran_greet_condition()
{
	return 1;
};

func void dia_baaltaran_greet_info()
{
	AI_Output(other,self,"DIA_BaalTaran_Greet_15_00");	//Я новенький. А ты кто?
	AI_Output(self,other,"DIA_BaalTaran_Greet_05_01");	//Я Идол Тэран, один из верных Спящему. Я пришел из лагеря Братства.
};


instance DIA_BAALTARAN_BRUDERSCHAFT(C_INFO)
{
	npc = nov_1331_baaltaran;
	nr = 1;
	condition = dia_baaltaran_bruderschaft_condition;
	information = dia_baaltaran_bruderschaft_info;
	permanent = 0;
	description = "Что такое братство Спящего?";
};


func int dia_baaltaran_bruderschaft_condition()
{
	if(Npc_KnowsInfo(hero,dia_baaltaran_greet))
	{
		return 1;
	};
};

func void dia_baaltaran_bruderschaft_info()
{
	AI_Output(other,self,"DIA_BaalTaran_Bruderschaft_15_00");	//Что такое братство Спящего?
	AI_Output(self,other,"DIA_BaalTaran_Bruderschaft_05_01");	//Мы так называем Братство последователей новой веры.
	AI_Output(self,other,"DIA_BaalTaran_Bruderschaft_05_02");	//Наш лагерь находится к востоку отсюда, среди болот. В Старом лагере я несу людям слово Спящего.
};


instance DIA_BAALTARAN_SLEEPER(C_INFO)
{
	npc = nov_1331_baaltaran;
	nr = 1;
	condition = dia_baaltaran_sleeper_condition;
	information = dia_baaltaran_sleeper_info;
	permanent = 0;
	description = "Кто такой Спящий?";
};


func int dia_baaltaran_sleeper_condition()
{
	if(Npc_KnowsInfo(hero,dia_baaltaran_greet))
	{
		return 1;
	};
};

func void dia_baaltaran_sleeper_info()
{
	AI_Output(other,self,"DIA_BaalTaran_Sleeper_15_00");	//Кто такой Спящий?
	AI_Output(self,other,"DIA_BaalTaran_Sleeper_05_01");	//Спящий - наш спаситель. Он раскрыл себя в видениях нашему Учителю Юбериону пять лет назад.
	AI_Output(self,other,"DIA_BaalTaran_Sleeper_05_02");	//С тех пор мы отвернулись от трех богов. Тебе тоже предстоит это сделать.
	AI_Output(self,other,"DIA_BaalTaran_Sleeper_05_03");	//Эти боги не смогли нам помочь, они покинули нас, допустили проведение этого нелепого эксперимента с Барьером. Но Спящий освободит нас отсюда!
};


instance DIA_BAALTARAN_LEHRE(C_INFO)
{
	npc = nov_1331_baaltaran;
	nr = 3;
	condition = dia_baaltaran_lehre_condition;
	information = dia_baaltaran_lehre_info;
	permanent = 0;
	description = "Что ты можешь рассказать мне о Спящем?";
};


func int dia_baaltaran_lehre_condition()
{
	if(Npc_KnowsInfo(hero,dia_baaltaran_bruderschaft))
	{
		return 1;
	};
};

func void dia_baaltaran_lehre_info()
{
	AI_Output(other,self,"DIA_BaalTaran_Lehre_15_00");	//Что ты можешь рассказать мне о Спящем?
	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_01");	//Спящий обладает огромной силой. Я думаю, что даже Иннос, бог света, не сравнится с ним.
	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_02");	//Его дух пребывает с нами. Но сам он не может явить нам всю свою мощь. Его сон продолжается тысячу лет, но скоро, скоро наступит миг пробуждения.
	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_03");	//Он избрал нас, чтобы нести неверным его учение, чтобы засвидетельствовать его пробуждение и рассказать об этом чуде.
	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_04");	//Знай же, что все, кто уверует в Спящего, сохранят свои души незапятнанными, а неверные будут стерты с лица земли.
	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_05");	//Но Спящий милостив, и потому посылает доказательства своей силы всем, кто сомневается в нем.
};


instance DIA_BAALTARAN_FREIHEIT(C_INFO)
{
	npc = nov_1331_baaltaran;
	nr = 4;
	condition = dia_baaltaran_freiheit_condition;
	information = dia_baaltaran_freiheit_info;
	permanent = 0;
	description = "А как будет выглядеть путь к свободе?";
};


func int dia_baaltaran_freiheit_condition()
{
	if(Npc_KnowsInfo(hero,dia_baaltaran_sleeper))
	{
		return 1;
	};
};

func void dia_baaltaran_freiheit_info()
{
	AI_Output(other,self,"DIA_BaalTaran_Freiheit_15_00");	//А как будет выглядеть путь к свободе?
	AI_Output(self,other,"DIA_BaalTaran_Freiheit_05_01");	//Мы готовим великую Церемонию, в которой объединим все духовные силы и призовем Спящего.
	AI_Output(self,other,"DIA_BaalTaran_Freiheit_05_02");	//Во время Церемонии наш господин укажет нам путь к свободе.
};


instance DIA_BAALTARAN_BEWEIS(C_INFO)
{
	npc = nov_1331_baaltaran;
	nr = 3;
	condition = dia_baaltaran_beweis_condition;
	information = dia_baaltaran_beweis_info;
	permanent = 0;
	description = "Есть ли у тебя доказательства его силы?";
};


func int dia_baaltaran_beweis_condition()
{
	if(Npc_KnowsInfo(hero,dia_baaltaran_sleeper))
	{
		return 1;
	};
};

func void dia_baaltaran_beweis_info()
{
	AI_Output(other,self,"DIA_BaalTaran_Beweis_15_00");	//Есть ли у тебя доказательства его силы?
	AI_Output(self,other,"DIA_BaalTaran_Beweis_05_01");	//Свою волю он раскрывает нам в видениях. Те, кто хоть раз слышал его голос, больше никогда не сомневаются в его силе.
	AI_Output(self,other,"DIA_BaalTaran_Beweis_05_02");	//На болотах мы собираем траву, которая помогает последователям приблизиться к тайне Спящего и услышать его. Некоторым из нас выпадает честь созерцать видения, которые он посылает.
	AI_Output(other,self,"DIA_BaalTaran_Beweis_15_03");	//Понятно.
};


instance DIA_BAALTARAN_WAYTOST(C_INFO)
{
	npc = nov_1331_baaltaran;
	nr = 1;
	condition = dia_baaltaran_waytost_condition;
	information = dia_baaltaran_waytost_info;
	permanent = 0;
	description = "Как я могу найти лагерь Братства?";
};


func int dia_baaltaran_waytost_condition()
{
	if(Npc_KnowsInfo(hero,dia_baaltaran_bruderschaft))
	{
		return 1;
	};
};

func void dia_baaltaran_waytost_info()
{
	AI_Output(other,self,"DIA_BaalTaran_WayToST_15_00");	//Как я могу найти лагерь Братства?
	AI_Output(self,other,"DIA_BaalTaran_WayToST_05_01");	//Сейчас у меня много дел. Ты можешь обратиться к Идолу Парвезу, который тоже пришел в этот лагерь.
	AI_Output(self,other,"DIA_BaalTaran_WayToST_05_02");	//Его можно найти недалеко от рынка, по другую сторону замка. По-моему, у него там есть своя хижина.
	if((Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINPSI,LOG_RUNNING);
		b_logentry(CH1_JOINPSI,"Послушник по имени Идол Парвез может отвести меня в Болотный лагерь. Я смогу найти его на рыночной площади за замком в Старом лагере.");
	};
};


instance DIA_BAALTARAN_INTOCASTLE(C_INFO)
{
	npc = nov_1331_baaltaran;
	nr = 10;
	condition = dia_baaltaran_intocastle_condition;
	information = dia_baaltaran_intocastle_info;
	permanent = 0;
	description = "Мне нужно попасть в замок. Ты можешь мне помочь?";
};


func int dia_baaltaran_intocastle_condition()
{
	if(Npc_KnowsInfo(hero,dia_baaltaran_greet) && (Npc_HasItems(hero,itwr_fire_letter_01) || Npc_HasItems(hero,itwr_fire_letter_02)))
	{
		return 1;
	};
};

func void dia_baaltaran_intocastle_info()
{
	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_15_00");	//Мне нужно попасть в замок. Ты можешь мне помочь?
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_05_01");	//Боюсь, это невозможно. В замок могут попасть только те из нас, кто поставляет Гомезу болотник из нашего лагеря.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_05_02");	//Мы собираем его и часть продаем в других лагерях, а часть меняем на товары из внешнего мира.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_05_03");	//Если бы ты был одним из курьеров, работающих на Кор Галома, тебя бы пропустили в замок. Но для этого ты должен вступить в наше Братство.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_05_04");	//А что тебе нужно в замке?
	Info_ClearChoices(dia_baaltaran_intocastle);
	Info_AddChoice(dia_baaltaran_intocastle,"Мне нужно поговорить там с одним человеком.",dia_baaltaran_intocastle_meetsomeone);
	Info_AddChoice(dia_baaltaran_intocastle,"У меня есть послание к Верховному Магу Круга Огня.",dia_baaltaran_intocastle_letter);
};

func void dia_baaltaran_intocastle_meetsomeone()
{
	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00");	//Мне нужно поговорить там с одним человеком.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01");	//Да? А почему бы тебе не подождать, пока он сам выйдет из замка?
	Info_ClearChoices(dia_baaltaran_intocastle);
	Info_AddChoice(dia_baaltaran_intocastle,"Тебе это знать не обязательно.",dia_baaltaran_intocastle_forgetit);
	Info_AddChoice(dia_baaltaran_intocastle,"Это один из магов.",dia_baaltaran_intocastle_mage);
};

func void dia_baaltaran_intocastle_letter()
{
	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_Letter_15_00");	//У меня есть послание к Верховному Магу Круга Огня.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Letter_05_01");	//Письмо? А откуда оно у тебя? Его дали тебе маги, до того как ты попал в эту тюрьму, да?
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Letter_05_02");	//Тебе не следует рассказывать об этом. Но не волнуйся - сам я никому ничего не скажу.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Letter_05_03");	//Но ради собственной безопасности не говори о нем никому, хорошо? Из-за него тебя могут убить на месте.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Letter_05_04");	//Каждому захочется получить награду, положенную гонцу, доставившему письмо из внешнего мира.
	if(LETTER_TOLD == 0)
	{
		LETTER_TOLD = 1;
	}
	else if(LETTER_TOLD == 1)
	{
		LETTER_TOLD = 2;
		if(!Npc_IsDead(vlk_505_buddler))
		{
			b_exchangeroutine(vlk_505_buddler,"letterwait");
		};
		if(!Npc_IsDead(vlk_506_buddler))
		{
			b_exchangeroutine(vlk_506_buddler,"letterwait");
		};
	};
	Info_ClearChoices(dia_baaltaran_intocastle);
};

func void dia_baaltaran_intocastle_mage()
{
	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_Mage_15_00");	//Это один из магов.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Mage_05_01");	//О! Маги никогда не выходят из замка. Тебе самому придется найти способ попасть к ним.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Mage_05_02");	//Зачем же он тебе нужен? Неужели, чтобы купить магические руны или зелья?
	Info_ClearChoices(dia_baaltaran_intocastle);
	Info_AddChoice(dia_baaltaran_intocastle,"Тебе это знать не обязательно.",dia_baaltaran_intocastle_forgetit);
	Info_AddChoice(dia_baaltaran_intocastle,"Верно, ты угадал.",dia_baaltaran_intocastle_exactly);
};

func void dia_baaltaran_intocastle_forgetit()
{
	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00");	//Тебе это знать не обязательно.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01");	//Как знаешь, брат. Я же просто хотел помочь...
	Info_ClearChoices(dia_baaltaran_intocastle);
};

func void dia_baaltaran_intocastle_exactly()
{
	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_Exactly_15_00");	//Верно, ты угадал.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Exactly_05_01");	//Я так и подумал! Что же еще нужно от магов такому человеку как ты.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Exactly_05_02");	//Мой тебе совет: забудь об этих магах. Их товары тебе не по карману.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Exactly_05_03");	//В нашем лагере все эти руны и зелья стоят гораздо дешевле.
	Info_ClearChoices(dia_baaltaran_intocastle);
};

