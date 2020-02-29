
instance DIA_RUFUS_EXIT(C_INFO)
{
	npc = bau_903_rufus;
	nr = 999;
	condition = dia_rufus_exit_condition;
	information = dia_rufus_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_rufus_exit_condition()
{
	return 1;
};

func void dia_rufus_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_RUFUS_WASSER(C_INFO)
{
	npc = bau_903_rufus;
	nr = 800;
	condition = info_rufus_wasser_condition;
	information = info_rufus_wasser_info;
	permanent = 1;
	description = "Меня послал Лефти. Я принес воды.";
};


func int info_rufus_wasser_condition()
{
	var C_NPC lefty;
	lefty = Hlp_GetNpc(org_844_lefty);
	if(((LEFTY_MISSION == LOG_RUNNING) || ((LEFTY_MISSION == LOG_SUCCESS) && Npc_HasItems(other,itfo_potion_water_01))) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()) && (lefty.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void info_rufus_wasser_info()
{
	AI_Output(other,self,"Info_Rufus_Wasser_15_00");	//Меня послал Лефти. Я принес воды.
	if(Npc_HasItems(other,itfo_potion_water_01) >= 1)
	{
		AI_Output(self,other,"Info_Rufus_Wasser_02_01");	//Спасибо, приятель. Меня мучит жажда.
		b_giveinvitems(other,self,itfo_potion_water_01,1);
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,itfo_potion_water_01);
		AN_BAUERN_VERTEILT = AN_BAUERN_VERTEILT + 1;
		if(AN_BAUERN_VERTEILT >= DURSTIGEBAUERN)
		{
			LEFTY_MISSION = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00");	//Вода! Эй, парень! Да у тебя же совсем ничего не осталось! Только не говори мне, что ты напоил всех, кроме меня!
	};
};


instance DIA_RUFUS_HELLO(C_INFO)
{
	npc = bau_903_rufus;
	nr = 1;
	condition = dia_rufus_hello_condition;
	information = dia_rufus_hello_info;
	permanent = 0;
	description = "Привет!";
};


func int dia_rufus_hello_condition()
{
	return 1;
};

func void dia_rufus_hello_info()
{
	if(KAPITEL == 1)
	{
		AI_Output(other,self,"DIA_Rufus_Hello_15_00");	//Привет! Я здесь новенький. Вот, хотел узнать, как тут дела?
	}
	else
	{
		AI_Output(other,self,"DIA_Ghorim_MissingHarlok_15_00");	//Привет! Как дела?
	};
	AI_Output(self,other,"DIA_Rufus_Hello_02_01");	//Спроси кого-нибудь еще, а? Я просто работаю в поле и ничего не знаю.
	AI_Output(self,other,"DIA_Rufus_Hello_02_02");	//Эх, парень, я бы с удовольствием предложил нашему Лорду самому заниматься этой чертовой работой!
};


instance DIA_RUFUS_WHY(C_INFO)
{
	npc = bau_903_rufus;
	nr = 1;
	condition = dia_rufus_why_condition;
	information = dia_rufus_why_info;
	permanent = 0;
	description = "Если тебе не нравится такая работа, тогда почему ты здесь?";
};


func int dia_rufus_why_condition()
{
	if(Npc_KnowsInfo(hero,dia_rufus_hello))
	{
		return 1;
	};
};

func void dia_rufus_why_info()
{
	var C_NPC ricelord;
	AI_Output(other,self,"DIA_Rufus_Why_15_00");	//Если тебе не нравится такая работа, тогда почему согласился работать здесь?
	AI_Output(self,other,"DIA_Rufus_Why_02_01");	//Это случилось в первый же день, после того как я попал сюда. Лефти, один из головорезов Лорда, пришел ко мне и предложил поработать на полях.
	AI_Output(self,other,"DIA_Rufus_Why_02_02");	//Конечно, я согласился. Я был новичком и хотел стать хоть в чем-то полезным.
	AI_Output(self,other,"DIA_Rufus_Why_02_03");	//На следующий день, когда я остановился немного передохнуть, этот тип появился снова.
	AI_Output(self,other,"DIA_Rufus_Why_02_04");	//'Ты же не хочешь, чтобы твои товарищи делали всю работу за тебя, так?' - спросил он.
	AI_Output(self,other,"DIA_Rufus_Why_02_05");	//Я сказал ему, что окончательно вымотался в первый же день, что мне нужен отдых и все такое... Но он даже не слушал.
	AI_Output(self,other,"DIA_Rufus_Why_02_06");	//Просто ухватил меня за воротник и потащил обратно в поле.
	AI_Output(self,other,"DIA_Rufus_Why_02_07");	//С того случая он каждый день поджидал меня возле двери. До тех пор, пока я сам не стал ходить на работу. Не хочу ссориться с этими типами.
	AI_Output(self,other,"DIA_Rufus_Why_02_08");	//Это настоящие головорезы, и лучше держаться от них подальше.
	ricelord = Hlp_GetNpc(bau_900_ricelord);
	ricelord.aivar[AIV_FINDABLE] = TRUE;
};


instance DIA_RUFUS_RICELORD(C_INFO)
{
	npc = bau_903_rufus;
	nr = 2;
	condition = dia_rufus_ricelord_condition;
	information = dia_rufus_ricelord_info;
	permanent = 1;
	description = "Кто он такой этот Лорд?";
};


func int dia_rufus_ricelord_condition()
{
	if(Npc_KnowsInfo(hero,dia_rufus_hello))
	{
		return 1;
	};
};

func void dia_rufus_ricelord_info()
{
	var C_NPC ricelord;
	AI_Output(other,self,"DIA_Rufus_Ricelord_15_00");	//Кто он такой, этот Лорд?
	AI_Output(self,other,"DIA_Rufus_Ricelord_02_01");	//Он появился здесь одним из первых, помог основать лагерь и засеять рисовые поля.
	AI_Output(self,other,"DIA_Rufus_Ricelord_02_02");	//Сейчас сидит без дела у себя в амбаре. Старый толстяк, отъелся, как свинья.
	ricelord = Hlp_GetNpc(bau_900_ricelord);
	ricelord.aivar[AIV_FINDABLE] = TRUE;
};

instance INFO_RUFUS_WASSER_NOLEFTY(C_INFO)
{
	npc = bau_903_rufus;
	nr = 800;
	condition = info_rufus_wasser_nolefty_condition;
	information = info_rufus_wasser_nolefty_info;
	permanent = 1;
	description = "Я принес тебе воды.";
};

func int info_rufus_wasser_nolefty_condition()
{
	var C_NPC lefty;
	lefty = Hlp_GetNpc(org_844_lefty);
	if(Npc_HasItems(other,itfo_potion_water_01) && (lefty.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void info_rufus_wasser_nolefty_info()
{
	AI_Output(other,self,"Info_Wasser_NoLefty");	//Я принес тебе воды.
	AI_Output(self,other,"Info_Rufus_Wasser_02_01");	//Спасибо, приятель. Меня мучит жажда.
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	b_giveinvitems(other,self,itfo_potion_water_01,1);
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_UseItem(self,itfo_potion_water_01);
};

instance DIA_RUFUS_HELLO2(C_INFO)
{
	npc = bau_903_rufus;
	nr = 1;
	condition = dia_rufus_hello2_condition;
	information = dia_rufus_hello2_info;
	permanent = 0;
	important = 1;
};


func int dia_rufus_hello2_condition()
{
	var C_NPC lefty;
	lefty = Hlp_GetNpc(org_844_lefty);
	if(lefty.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		return 1;
	};
};

func void dia_rufus_hello2_info()
{
	AI_Output(self,other,"SVM_2_HeDeservedIt");	//Он получил по заслугам.
	AI_StopProcessInfos(self);
};

