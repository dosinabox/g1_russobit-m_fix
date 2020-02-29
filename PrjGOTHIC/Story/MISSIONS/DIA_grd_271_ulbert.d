
instance GRD_271_ULBERT_EXIT(C_INFO)
{
	npc = grd_271_ulbert;
	nr = 999;
	condition = grd_271_ulbert_exit_condition;
	information = grd_271_ulbert_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int grd_271_ulbert_exit_condition()
{
	return 1;
};

func void grd_271_ulbert_exit_info()
{
	AI_StopProcessInfos(self);
};


instance GRD_271_ULBERT_KEY(C_INFO)
{
	npc = grd_271_ulbert;
	condition = grd_271_ulbert_key_condition;
	information = grd_271_ulbert_key_info;
	important = 0;
	permanent = 0;
	description = "Что хранится на складе?";
};


func int grd_271_ulbert_key_condition()
{
	return 1;
};

func void grd_271_ulbert_key_info()
{
	AI_Output(other,self,"GRD_271_ULBERT_KEY_Info_15_01");	//Что хранится на складе?
	AI_Output(self,other,"GRD_271_ULBERT_KEY_Info_07_02");	//Это тебя не касается.
};


instance GRD_271_ULBERT_TRICK(C_INFO)
{
	npc = grd_271_ulbert;
	condition = grd_271_ulbert_trick_condition;
	information = grd_271_ulbert_trick_info;
	important = 0;
	permanent = 0;
	description = "А ты здесь давно стоишь. Хочешь пить?";
};


func int grd_271_ulbert_trick_condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_key))
	{
		return 1;
	};
};

func void grd_271_ulbert_trick_info()
{
	AI_Output(other,self,"GRD_271_ULBERT_TRICK_Info_15_01");	//А ты здесь давно стоишь. Хочешь пить?
	AI_Output(self,other,"GRD_271_ULBERT_TRICK_Info_07_02");	//Ты прав! Да, с удовольствием бы что-нибудь выпил. А у тебя есть с собой что-нибудь?
	Log_CreateTopic(CH2_STORAGESHED,LOG_MISSION);
	Log_SetTopicStatus(CH2_STORAGESHED,LOG_RUNNING);
	b_logentry(CH2_STORAGESHED,"Стражник Ульберт сторожит ящики на складе в Старой шахте. Я должен найти ему какую-нибудь выпивку!");
};


instance GRD_271_ULBERT_DRINK(C_INFO)
{
	npc = grd_271_ulbert;
	condition = grd_271_ulbert_drink_condition;
	information = grd_271_ulbert_drink_info;
	important = 0;
	permanent = 0;
	description = "(угостить)";
};


func int grd_271_ulbert_drink_condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_trick) && (Npc_HasItems(hero,itfobeer) || Npc_HasItems(hero,itfowine) || Npc_HasItems(hero,itfobooze)))
	{
		return 1;
	};
};

func void grd_271_ulbert_drink_info()
{
	AI_Output(other,self,"GRD_271_ULBERT_DRINK_Info_15_01");	//Вот, выпей это за мое здоровье!
	AI_Output(self,other,"GRD_271_ULBERT_DRINK_Info_07_02");	//Спасибо.
	if(Npc_HasItems(hero,itfobeer))
	{
		b_printtrademsg1("Отдано пиво.");
		b_giveinvitems(hero,self,itfobeer,1);
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,itfobeer);
	}
	else if(Npc_HasItems(hero,itfowine))
	{
		b_printtrademsg1("Отдано вино.");
		b_giveinvitems(hero,self,itfowine,1);
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,itfowine);
	}
	else if(Npc_HasItems(hero,itfobooze))
	{
		b_printtrademsg1("Отдан шнапс.");
		b_giveinvitems(hero,self,itfobooze,1);
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,itfobooze);
	};
};


instance GRD_271_ULBERT_DRUNK(C_INFO)
{
	npc = grd_271_ulbert;
	condition = grd_271_ulbert_drunk_condition;
	information = grd_271_ulbert_drunk_info;
	important = 0;
	permanent = 0;
	description = "Так ты можешь сказать, что хранится на складе?";
};


func int grd_271_ulbert_drunk_condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_drink))
	{
		return 1;
	};
};

func void grd_271_ulbert_drunk_info()
{
	AI_Output(other,self,"GRD_271_ULBERT_DRUNK_Info_15_01");	//Так ты можешь сказать, что хранится на складе?
	AI_Output(self,other,"GRD_271_ULBERT_DRUNK_Info_07_02");	//Ну, несколько сундуков с припасами. Только вот ключ от них все равно потерялся.
	AI_Output(other,self,"GRD_271_ULBERT_DRUNK_Info_15_03");	//Потерялся?
	AI_Output(self,other,"GRD_271_ULBERT_DRUNK_Info_07_04");	//Да. Думаю, без Алефа здесь не обошлось. Ему вообще не стоит доверять.
	b_logentry(CH2_STORAGESHED,"Когда я принес Ульберту выпивку, он рассказал мне, что потерял ключ от ящиков. Может быть, Алеф, рудокоп, что-то знает об этом?");
};


instance GRD_271_ULBERT_LOCK(C_INFO)
{
	npc = grd_271_ulbert;
	condition = grd_271_ulbert_lock_condition;
	information = grd_271_ulbert_lock_info;
	important = 0;
	permanent = 0;
	description = "(отвлечь Ульберта)";
};


func int grd_271_ulbert_lock_condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_drunk))
	{
		return 1;
	};
};

func void grd_271_ulbert_lock_info()
{
	AI_Output(other,self,"GRD_271_ULBERT_LOCK_Info_15_01");	//Слушай, Ян и стражники сидят внизу и едят жареное мясо.
	AI_Output(self,other,"GRD_271_ULBERT_LOCK_Info_07_02");	//Что? Без меня? Ну, так я пойду и заберу свою долю.
	self.aivar[AIV_ITEMSCHWEIN] = FALSE;
	b_logentry(CH2_STORAGESHED,"Я смог легко отвлечь Ульберта. Он ушел со склада!");
	Npc_ExchangeRoutine(self,"away");
	AI_StopProcessInfos(self);
};


instance GRD_271_ULBERT_ANGRY(C_INFO)
{
	npc = grd_271_ulbert;
	condition = grd_271_ulbert_angry_condition;
	information = grd_271_ulbert_angry_info;
	important = 1;
	permanent = 0;
};


func int grd_271_ulbert_angry_condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_lock) && (Npc_GetDistToWP(hero,"OM_CAVE1_49") < 600))
	{
		return TRUE;
	};
};

func void grd_271_ulbert_angry_info()
{
	AI_Output(self,other,"GRD_271_ULBERT_ANGRY_Info_07_01");	//Эй, ты, не было там никакого мяса!
	AI_Output(other,self,"GRD_271_ULBERT_ANGRY_Info_15_02");	//А... э... Наверное, я ошибся! Желаю хорошего дня!
	self.aivar[AIV_ITEMSCHWEIN] = TRUE;
	b_givexp(XP_LUREULBERTAWAY);
	b_logentry(CH2_STORAGESHED,"Я снова встретил Ульберта. Он до сих пор не понял, что я обманул его. Какой наивный солдат!");
	Log_SetTopicStatus(CH2_STORAGESHED,LOG_SUCCESS);
	Npc_ExchangeRoutine(self,"start");
	AI_StopProcessInfos(self);
};

