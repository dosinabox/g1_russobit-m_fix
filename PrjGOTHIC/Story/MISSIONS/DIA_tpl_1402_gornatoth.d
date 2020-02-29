
instance DIA_TPL_1402_GORNATOTH_EXIT(C_INFO)
{
	npc = tpl_1402_gornatoth;
	nr = 999;
	condition = dia_tpl_1402_gornatoth_exit_condition;
	information = dia_tpl_1402_gornatoth_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_tpl_1402_gornatoth_exit_condition()
{
	return TRUE;
};

func void dia_tpl_1402_gornatoth_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNATOTH_ABWEISEND(C_INFO)
{
	npc = tpl_1402_gornatoth;
	nr = 1;
	condition = dia_gornatoth_abweisend_condition;
	information = dia_gornatoth_abweisend_info;
	permanent = 1;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int dia_gornatoth_abweisend_condition()
{
	if(!Npc_KnowsInfo(hero,dia_gornatoth_angartalked) && !c_npcbelongstopsicamp(hero))
	{
		return 1;
	};
};

func void dia_gornatoth_abweisend_info()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_11_01");	//Уйди от меня, неверный! Я тренирую только Стражей Спящего!
	AI_StopProcessInfos(self);
};


instance DIA_GORNATOTH_ANGARTALKED(C_INFO)
{
	npc = tpl_1402_gornatoth;
	nr = 1;
	condition = dia_gornatoth_angartalked_condition;
	information = dia_gornatoth_angartalked_info;
	permanent = 0;
	important = 1;
};


func int dia_gornatoth_angartalked_condition()
{
	if(Npc_KnowsInfo(hero,dia_corangar_latertrainer) && KAPITEL < 2)
	{
		return 1;
	};
};

func void dia_gornatoth_angartalked_info()
{
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_11_00");	//Кор Ангар говорил с тобой? Что он тебе сказал?
	Info_ClearChoices(dia_gornatoth_angartalked);
	Info_AddChoice(dia_gornatoth_angartalked,"Твой учитель сказал, что ты недостоин носить доспех Стража.",dia_gornatoth_angartalked_unworthy);
	Info_AddChoice(dia_gornatoth_angartalked,"Он сказал, что ему не нравятся болотожоры.",dia_gornatoth_angartalked_shark);
	Info_AddChoice(dia_gornatoth_angartalked,"Он сказал, что я должен прийти к нему, когда стану стражем.",dia_gornatoth_angartalked_normal);
};

func void dia_gornatoth_angartalked_normal()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Normal_15_00");	//Он сказал, что я должен прийти к нему, когда стану стражем.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Normal_11_01");	//Наверное, ты ему понравился. Он почти никогда ни с кем не разговаривает.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Normal_11_02");	//Он оказал тебе большую честь, заговорив с тобой. Со мной он в последний раз говорил два месяца назад.
	Info_ClearChoices(dia_gornatoth_angartalked);
};

func void dia_gornatoth_angartalked_shark()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Shark_15_00");	//Он сказал, что ему не нравятся болотожоры.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Shark_11_01");	//Он так сказал?.. Мне предстоит исполнить священную миссию!
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Shark_11_02");	//Желание моего Учителя для меня закон.
	Info_ClearChoices(dia_gornatoth_angartalked);
};

func void dia_gornatoth_angartalked_unworthy()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Unworthy_15_00");	//Твой учитель сказал, что ты недостоин носить доспехи Стража.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Unworthy_11_01");	//Нет! Он никогда не сказал бы этого! Только не обо мне!
	Info_ClearChoices(dia_gornatoth_angartalked);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};


instance TPL_1402_GORNATOTH_GETSTUFF(C_INFO)
{
	npc = tpl_1402_gornatoth;
	condition = tpl_1402_gornatoth_getstuff_condition;
	information = tpl_1402_gornatoth_getstuff_info;
	important = 0;
	permanent = 0;
	description = "Я пришел, чтобы взять доспех Стража.";
};


func int tpl_1402_gornatoth_getstuff_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		return TRUE;
	};
};

func void tpl_1402_gornatoth_getstuff_info()
{
	AI_Output(other,self,"TPL_1402_GorNaToth_GETSTUFF_Info_15_01");	//Я пришел, чтобы взять доспехи Стража.
	AI_Output(self,other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_02");	//Я очень рад, что могу передать тебе один из наших доспехов. Ты заслужил их, ведь это ты обнаружил яйца ползунов.
	AI_Output(self,other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_03");	//Пусть этот доспех хранит тебя, как Спящий хранит наше Братство!
	b_printtrademsg1("Получен легкий доспех Стража.");
	b_logentry(GE_BECOMETEMPLAR,"Гор На Тоф вручил мне мой первый доспех Стража. Теперь я стал частью этого общества воинов!");
	Log_CreateTopic(GE_TRADERPSI,LOG_NOTE);
	b_logentry(GE_TRADERPSI,"У Гор На Тофа есть хорошие доспехи Стражей, но получить их может только тот, кто внес значительное пожертвование на нужды Братства. Я могу найти его на тренировочной площадке лагеря Братства.");
	CreateInvItem(self,tpl_armor_l);
	b_giveinvitems(self,hero,tpl_armor_l,1);
	AI_EquipArmor(hero,tpl_armor_l);
};


var int gornatoth_armor_m_was_bought;
var int gornatoth_armor_h_was_bought;

instance TPL_1402_GORNATOTH_ARMOR(C_INFO)
{
	npc = tpl_1402_gornatoth;
	condition = tpl_1402_gornatoth_armor_condition;
	information = tpl_1402_gornatoth_armor_info;
	important = 0;
	permanent = 1;
	description = "Мне нужен более прочный доспех.";
};


func int tpl_1402_gornatoth_armor_condition()
{
	if(Npc_KnowsInfo(hero,tpl_1402_gornatoth_getstuff) && ((GORNATOTH_ARMOR_M_WAS_BOUGHT != 1) || (GORNATOTH_ARMOR_H_WAS_BOUGHT != 1)))
	{
		return TRUE;
	};
};

func void tpl_1402_gornatoth_armor_info()
{
	AI_Output(other,self,"Info_GorNaToth_ARMOR_15_01");	//Мне нужны более прочные доспехи.
	AI_Output(self,other,"Info_GorNaToth_ARMOR_11_02");	//Я могу дать тебе доспех получше, но за это ты внесешь пожертвование на нужды нашего Братства.
	Info_ClearChoices(tpl_1402_gornatoth_armor);
	Info_AddChoice(tpl_1402_gornatoth_armor,DIALOG_BACK,tpl_1402_gornatoth_armor_back);
	if(GORNATOTH_ARMOR_H_WAS_BOUGHT != 1)
	{
		Info_AddChoice(tpl_1402_gornatoth_armor,b_buildbuyarmorstring("Тяжелый доспех стража, защита: 70/10/35/0",VALUE_TPL_ARMOR_H),tpl_1402_gornatoth_armor_h);
	};
	if(GORNATOTH_ARMOR_M_WAS_BOUGHT != 1)
	{
		Info_AddChoice(tpl_1402_gornatoth_armor,b_buildbuyarmorstring("Средний доспех стража, защита: 55/10/25/0",VALUE_TPL_ARMOR_M),tpl_1402_gornatoth_armor_m);
	};
};

func void tpl_1402_gornatoth_armor_m()
{
	AI_Output(hero,self,"Info_GorNaToth_ARMOR_M_15_01");	//Мне нужны средние доспехи Стража.
	if(KAPITEL < 3)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_02");	//Сейчас ты не сможешь носить его. Сначала тебе придется доказать свою верность Братству и стать Стражем. Только после этого у тебя будет право на такой доспех.
	}
	else if(Npc_HasItems(hero,itminugget) < VALUE_TPL_ARMOR_M)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_03");	//Как только ты сможешь внести пожертвование на нужды Братства, ты получишь доспех получше.
	}
	else
	{
		b_printtrademsg1("Отдано руды: 1650");
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_04");	//Ты можешь внести пожертвование, поэтому я дам тебе такой доспех. Он станет твоей надежной защитой.
		b_printtrademsg2("Получен доспех Стража.");
		b_giveinvitems(hero,self,itminugget,VALUE_TPL_ARMOR_M);
		CreateInvItem(self,tpl_armor_m);
		b_giveinvitems(self,hero,tpl_armor_m,1);
		AI_EquipArmor(hero,tpl_armor_m);
		GORNATOTH_ARMOR_M_WAS_BOUGHT = 1;
	};
	Info_ClearChoices(tpl_1402_gornatoth_armor);
};

func void tpl_1402_gornatoth_armor_h()
{
	AI_Output(hero,self,"Info_GorNaToth_ARMOR_H_15_01");	//Я хочу взять тяжелые доспехи Стража.
	if(KAPITEL < 4)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_02");	//Ты для этого недостаточно опытен. Докажи, что ты верен нашему Братству, и только после этого ты будешь достоин носить столь совершенный доспех.
	}
	else if(Npc_HasItems(hero,itminugget) < VALUE_TPL_ARMOR_H)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_03");	//Ты заслужил право носить такой доспех, но сейчас у тебя нет возможности внести достойное пожертвование на нужды Братства!
	}
	else
	{
		b_printtrademsg1("Отдано руды: 2100");
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_04");	//Носи этот доспех в знак высочайшей чести, оказанной тебе Братством.
		b_printtrademsg2("Получен тяжелый доспех Стража.");
		b_giveinvitems(hero,self,itminugget,VALUE_TPL_ARMOR_H);
		CreateInvItem(hero,tpl_armor_h);
		AI_EquipArmor(hero,tpl_armor_h);
		GORNATOTH_ARMOR_H_WAS_BOUGHT = 1;
	};
	Info_ClearChoices(tpl_1402_gornatoth_armor);
};

func void tpl_1402_gornatoth_armor_back()
{
	AI_Output(hero,self,"Info_GorNaToth_ARMOR_BACK_15_01");	//Я передумал!
	AI_Output(self,hero,"Info_GorNaToth_ARMOR_BACK_11_02");	//Как хочешь. Ты знаешь, где меня можно найти.
	Info_ClearChoices(tpl_1402_gornatoth_armor);
};


instance TPL_1402_GORNATOTH_TEACH(C_INFO)
{
	npc = tpl_1402_gornatoth;
	nr = 10;
	condition = tpl_1402_gornatoth_teach_condition;
	information = tpl_1402_gornatoth_teach_info;
	permanent = 1;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int tpl_1402_gornatoth_teach_condition()
{
	if(c_npcbelongstopsicamp(hero))
	{
		return TRUE;
	};
};

func void tpl_1402_gornatoth_teach_info()
{
	AI_Output(other,self,"TPL_1402_GorNaToth_Teach_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"TPL_1402_GorNaToth_Teach_11_01");	//Настоящему воину необходима не только сила духа, но также сила мышц и ловкость движений.
	Info_ClearChoices(tpl_1402_gornatoth_teach);
	Info_AddChoice(tpl_1402_gornatoth_teach,DIALOG_BACK,tpl_1402_gornatoth_teach_back);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_1);
	if(LOG_GORNATOTHTRAIN == FALSE)
	{
		Log_CreateTopic(GE_TEACHERPSI,LOG_NOTE);
		b_logentry(GE_TEACHERPSI,"Страж Гор На Тоф может помочь мне повысить силу, ловкость и магическую силу, а также улучшить мое владение одноручным оружием.");
		LOG_GORNATOTHTRAIN = TRUE;
	};
};

func void tpl_1402_gornatoth_teach_back()
{
	Info_ClearChoices(tpl_1402_gornatoth_teach);
};

func void tpl_1402_gornatoth_teach_str_1()
{
	b_buyattributepoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(tpl_1402_gornatoth_teach);
	Info_AddChoice(tpl_1402_gornatoth_teach,DIALOG_BACK,tpl_1402_gornatoth_teach_back);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_1);
};

func void tpl_1402_gornatoth_teach_str_5()
{
	b_buyattributepoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(tpl_1402_gornatoth_teach);
	Info_AddChoice(tpl_1402_gornatoth_teach,DIALOG_BACK,tpl_1402_gornatoth_teach_back);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_1);
};

func void tpl_1402_gornatoth_teach_dex_1()
{
	b_buyattributepoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(tpl_1402_gornatoth_teach);
	Info_AddChoice(tpl_1402_gornatoth_teach,DIALOG_BACK,tpl_1402_gornatoth_teach_back);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_1);
};

func void tpl_1402_gornatoth_teach_dex_5()
{
	b_buyattributepoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(tpl_1402_gornatoth_teach);
	Info_AddChoice(tpl_1402_gornatoth_teach,DIALOG_BACK,tpl_1402_gornatoth_teach_back);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_1);
};

func void tpl_1402_gornatoth_teach_man_1()
{
	b_buyattributepoints(other,ATR_MANA_MAX,LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(tpl_1402_gornatoth_teach);
	Info_AddChoice(tpl_1402_gornatoth_teach,DIALOG_BACK,tpl_1402_gornatoth_teach_back);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_1);
};

func void tpl_1402_gornatoth_teach_man_5()
{
	b_buyattributepoints(other,ATR_MANA_MAX,5 * LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(tpl_1402_gornatoth_teach);
	Info_AddChoice(tpl_1402_gornatoth_teach,DIALOG_BACK,tpl_1402_gornatoth_teach_back);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNSTRENGTH_1,LPCOST_ATTRIBUTE_STRENGTH,0),tpl_1402_gornatoth_teach_str_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNDEXTERITY_1,LPCOST_ATTRIBUTE_DEXTERITY,0),tpl_1402_gornatoth_teach_dex_1);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_5,5 * LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_5);
	Info_AddChoice(tpl_1402_gornatoth_teach,b_buildlearnstring(NAME_LEARNMANA_1,LPCOST_ATTRIBUTE_MANA,0),tpl_1402_gornatoth_teach_man_1);
};


instance TPL_1402_GORNATOTH_TRAIN(C_INFO)
{
	npc = tpl_1402_gornatoth;
	condition = tpl_1402_gornatoth_train_condition;
	information = tpl_1402_gornatoth_train_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARN1H_1,LPCOST_TALENT_1H_1,0);
};


func int tpl_1402_gornatoth_train_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_1H) < 1) && c_npcbelongstopsicamp(hero) && LOG_GORNATOTHTRAIN == TRUE)
	{
		return TRUE;
	};
};

func void tpl_1402_gornatoth_train_info()
{
	if(LOG_GORNATOTHFIGHT == FALSE)
	{
		Log_CreateTopic(GE_TEACHERPSI,LOG_NOTE);
		b_logentry(GE_TEACHERPSI,"Страж Гор На Тоф может научить меня обращаться с одноручным мечом.");
		LOG_GORNATOTHFIGHT = TRUE;
	};
	AI_Output(other,self,"TPL_1402_GorNaToth_TRAIN_Info_15_00");	//Я хочу улучшить технику ведения боя с одноручным мечом.
	if(b_giveskill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1))
	{
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_01");	//Это хорошее решение! Чтобы улучшить технику ведения боя, ты должен научиться правильно держать оружие.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_02");	//Начиная тренироваться, многие неопытные воины стараются держать рукоять меча двумя руками. Это ненужная привычка, которая может помешать тебе в дальнейшем.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_03");	//Держи меч одной рукой. Клинок направь вверх и не держи его неподвижно.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_04");	//Ты должен научиться видеть меч как часть самого себя, и тогда его движения будут согласованы с движениями твоего тела. Это увеличит скорость атаки.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_05");	//Если ты будешь следовать моим советам, ты сможешь вести бой красиво. Но самое главное, твои движения станут быстрее.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_06");	//Да, есть еще кое-что: некоторые удары наносят большее повреждение противнику. Ты еще новичок, поэтому у тебя не так много шансов на критический удар.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_07");	//Но частые тренировки помогут тебе совершенствоваться и наносить все больше таких ударов.
		tpl_1402_gornatoth_train.permanent = 0;
		AI_StopProcessInfos(self);
		b_practicecombat("PSI_PATH_6_7");
	};
};


instance TPL_1402_GORNATOTH_TRAINAGAIN(C_INFO)
{
	npc = tpl_1402_gornatoth;
	condition = tpl_1402_gornatoth_trainagain_condition;
	information = tpl_1402_gornatoth_trainagain_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARN1H_2,LPCOST_TALENT_1H_2,0);
};


func int tpl_1402_gornatoth_trainagain_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 1) && c_npcbelongstopsicamp(hero))
	{
		return TRUE;
	};
};

func void tpl_1402_gornatoth_trainagain_info()
{
	AI_Output(other,self,"TPL_1402_GorNaToth_TRAINAGAIN_Info_15_01");	//Научи меня еще лучше владеть одноручным мечом.
	if(b_giveskill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2))
	{
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_02");	//Ты уже получил начальное представление о владении этим оружием. Если ты будешь держать меч клинком вниз, ты сможешь вложить большую силу в свой первый удар.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_03");	//Помнишь, что я говорил о хорошем размахе? Следующий шаг на пути к мастерству - умение использовать движения собственного тела. Если ты успел нанести два удара, сделай разворот. Это отвлечет противника и даст тебе возможность выбрать более удачную позицию.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_04");	//Затем размахнись и нанеси удар справа налево.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_05");	//Вернись в исходную стойку. Как ты знаешь, мастерство приходит с опытом. А теперь иди и не забывай о тренировках.
		tpl_1402_gornatoth_trainagain.permanent = 0;
		AI_StopProcessInfos(self);
		b_practicecombat("PSI_PATH_6_7");
	};
};

