
instance INFO_ERPRESSER(C_INFO)
{
	npc = org_888_erpresser;
	nr = 1;
	condition = info_erpresser_condition;
	information = info_erpresser_info;
	permanent = 1;
	important = 1;
};


func int info_erpresser_condition()
{
	if((Npc_GetAttitude(self,other) != ATT_FRIENDLY) && (self.aivar[AIV_HAS_ERPRESSED] == FALSE) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void info_erpresser_info()
{
	AI_Output(self,other,"Info_Erpresser_Info_13_01");	//Если ты хочешь пройти, тебе придется заплатить 10 кусков руды, иначе ничего не выйдет, понял?
	Info_ClearChoices(info_erpresser);
	Info_AddChoice(info_erpresser,"Спасибо. Ты меня выручил.",info_erpresser_choice_aufsmaul);
	Info_AddChoice(info_erpresser,"Вот десять кусков.",info_erpresser_choice_zahlen);
};

func void info_erpresser_choice_aufsmaul()
{
	AI_Output(other,self,"Info_Erpresser_Choice_AufsMaul_15_01");	//Спасибо. Ты меня выручил.
	AI_Output(self,other,"Info_Erpresser_Choice_AufsMaul_13_02");	//Спасибо. Ты меня выручил.
	self.aivar[AIV_HAS_ERPRESSED] = 2;
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
};

func void info_erpresser_choice_zahlen()
{
	if(Npc_HasItems(other,itminugget) >= 3)
	{
		AI_Output(other,self,"Info_Erpresser_Choice_Zahlen_15_01");	//Вот десять кусков.
		AI_Output(self,other,"Info_Erpresser_Choice_Zahlen_13_02");	//Вот не везет.
		self.aivar[AIV_HAS_ERPRESSED] = 1;
	}
	else
	{
		AI_Output(other,self,"Info_Erpresser_Choice_Zahlen_15_03");	//Э... у меня сейчас нет десяти кусков...
		AI_Output(self,other,"Info_Erpresser_Choice_Zahlen_13_04");	//Какая жалость...
		self.aivar[AIV_HAS_ERPRESSED] = 2;
		Npc_SetTarget(self,other);
		AI_StartState(self,zs_attack,1,"");
	};
	AI_StopProcessInfos(self);
};


instance INFO_BEREITSERPRESST(C_INFO)
{
	npc = org_888_erpresser;
	nr = 1;
	condition = info_bereitserpresst_condition;
	information = info_bereitserpresst_info;
	permanent = 1;
	important = 1;
};


func int info_bereitserpresst_condition()
{
	if((self.aivar[AIV_HAS_ERPRESSED] == 1) && Npc_IsInState(self,zs_talk))
	{
		return 1;
	};
};

func void info_bereitserpresst_info()
{
	AI_Output(self,other,"Info_BereitsErpresst_Info_13_02");	//Ты заплатил. Проходи, пока я не передумал.
};


instance INFO_BEREITSAUFSMAUL(C_INFO)
{
	npc = org_888_erpresser;
	nr = 1;
	condition = info_bereitsaufsmaul_condition;
	information = info_bereitsaufsmaul_info;
	permanent = 1;
	important = 1;
};


func int info_bereitsaufsmaul_condition()
{
	if((self.aivar[AIV_HAS_ERPRESSED] == 2) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return 1;
	};
};

func void info_bereitsaufsmaul_info()
{
	AI_Output(self,other,"Info_BereitsAufsMaul_Info_13_02");	//Пошел отсюда, пока я не рассердился!
};


instance INFO_EXIT(C_INFO)
{
	npc = org_888_erpresser;
	nr = 999;
	condition = info_exit_condition;
	information = info_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_exit_condition()
{
	return 1;
};

func void info_exit_info()
{
	AI_StopProcessInfos(self);
};

