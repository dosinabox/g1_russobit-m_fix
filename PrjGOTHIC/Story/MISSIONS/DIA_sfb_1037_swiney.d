
instance INFO_SWINEY_EXIT(C_INFO)
{
	npc = sfb_1037_swiney;
	nr = 999;
	condition = info_swiney_exit_condition;
	information = info_swiney_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_swiney_exit_condition()
{
	return 1;
};

func void info_swiney_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_SWINEY_HELLO(C_INFO)
{
	npc = sfb_1037_swiney;
	nr = 1;
	condition = info_swiney_hello_condition;
	information = info_swiney_hello_info;
	permanent = 0;
	description = "Кто ты?";
};


func int info_swiney_hello_condition()
{
	return 1;
};

func void info_swiney_hello_info()
{
	AI_Output(other,self,"Info_Swiney_Hello_15_00");	//Кто ты?
	AI_Output(self,other,"Info_Swiney_Hello_09_01");	//Я лучший проходчик в этой проклятой колонии.
	AI_Output(self,other,"Info_Swiney_Hello_09_02");	//Если бы не я, половина наших рудокопов давно бы валялась под завалами. Сами они не могут понять, где не стоит махать киркой.
};


instance INFO_SWINEY_SCHUERFER(C_INFO)
{
	npc = sfb_1037_swiney;
	nr = 1;
	condition = info_swiney_schuerfer_condition;
	information = info_swiney_schuerfer_info;
	permanent = 0;
	description = "Я хочу стать рудокопом, таким как ты.";
};


func int info_swiney_schuerfer_condition()
{
	if(Npc_KnowsInfo(hero,info_swiney_hello))
	{
		return 1;
	};
};

func void info_swiney_schuerfer_info()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_15_00");	//Я хочу стать рудокопом, таким как ты.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_01");	//Ты не шутишь? Не думай, что это прибыльное место. Три порции риса в день, а все остальное нужно добывать самому.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_02");	//Ты вообще знаешь, почему мы здесь? Мы надеемся, что наша работа поможет нам освободиться из этого места.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_03");	//Всю добытую руду мы складываем в одном месте. Раз в месяц каждый из нас получает 50 кусков руды, чтобы отдохнуть как следует.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_04");	//Это самое важное, что тебе следует знать.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_05");	//Ты хоть когда-нибудь брал в руки кирку?
	Info_ClearChoices(info_swiney_schuerfer);
	Info_AddChoice(info_swiney_schuerfer,"Нет.",info_swiney_schuerfer_nein);
	Info_AddChoice(info_swiney_schuerfer,"Да.",info_swiney_schuerfer_ja);
};

func void info_swiney_schuerfer_ja()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_Ja_15_00");	//Да.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Ja_09_01");	//Хорошо! Тогда ты сам знаешь, что нужно делать. Вот тебе рабочая одежда. Кирку тебе придется найти самому. Удачи!
	b_printtrademsg1("Получена одежда рудокопа.");
	CreateInvItem(hero,sfb_armor_l);
//	AI_EquipArmor(hero,sfb_armor_l);
	Info_ClearChoices(info_swiney_schuerfer);
};

func void info_swiney_schuerfer_nein()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_Nein_15_00");	//Нет.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_01");	//Конечно, нет! Хорошо. Слушай. Возьми эту рабочую одежду и надень ее прямо сейчас.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_02");	//Если ты этого не сделаешь, то любой камень сможет искалечить тебя. А это не понравится ни тебе, ни нам. Какая потом от тебя будет польза?
	b_printtrademsg1("Получена одежда рудокопа.");
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_03");	//Где-то неподалеку я видел одну старую кирку.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_04");	//Правда ты с ней много не наработаешь, ну, что ж...
	CreateInvItem(hero,sfb_armor_l);
//	AI_EquipArmor(hero,sfb_armor_l);
	Info_ClearChoices(info_swiney_schuerfer);
};


instance INFO_SWINEY_PERM(C_INFO)
{
	npc = sfb_1037_swiney;
	nr = 1;
	condition = info_swiney_perm_condition;
	information = info_swiney_perm_info;
	permanent = 1;
	description = "Вы уже много руды набрали?";
};


func int info_swiney_perm_condition()
{
	if(Npc_KnowsInfo(hero,info_swiney_schuerfer))
	{
		return 1;
	};
};

func void info_swiney_perm_info()
{
	AI_Output(other,self,"Info_Swiney_PERM_15_00");	//Вы уже много руды набрали?
	AI_Output(self,other,"Info_Swiney_PERM_09_01");	//Маги говорят, что очень скоро ее будет достаточно. Ты сможешь сходить в Новый лагерь и увидеть гору руды своими глазами.
	AI_StopProcessInfos(self);
};

