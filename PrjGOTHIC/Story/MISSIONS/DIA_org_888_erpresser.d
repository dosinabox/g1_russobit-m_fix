
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
	var C_NPC mordrag;
	mordrag = Hlp_GetNpc(org_826_mordrag);
	if((Npc_GetAttitude(self,other) != ATT_FRIENDLY) && (self.aivar[AIV_HAS_ERPRESSED] == FALSE) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE) && mordrag.aivar[AIV_PARTYMEMBER] == FALSE && GOPSTOPPED_BRIDGE == FALSE)
	{
		return 1;
	};
};

func void info_erpresser_info()
{
	var C_ITEM eqarmor2;
	eqarmor2 = Npc_GetEquippedArmor(hero);
	if(Hlp_IsItem(eqarmor2,org2n) || Hlp_IsItem(eqarmor2,org2l))
	{
		AI_Output(self,other,"SVM_13_GetOutOfHere");	//Сгинь! Здесь тебе не место!
		self.aivar[AIV_HAS_ERPRESSED] = 2;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"Info_Erpresser_Info_13_01");	//Если ты хочешь пройти, тебе придется заплатить 10 кусков руды, иначе ничего не выйдет, понял?
		Info_ClearChoices(info_erpresser);
		Info_AddChoice(info_erpresser,"Кажется, настало время проучить тебя!",info_erpresser_choice_aufsmaul);
		if(Npc_HasItems(other,itminugget) >= 10)
		{
			Info_AddChoice(info_erpresser,"Вот десять кусков.",info_erpresser_choice_zahlen);
		}
		else
		{
			Info_AddChoice(info_erpresser,"Э... у меня сейчас нет десяти кусков...",info_erpresser_choice_noore);
		};
	};
};

func void info_erpresser_choice_aufsmaul()
{
	var C_NPC coerpresser;
	coerpresser = Hlp_GetNpc(org_889_coerpresser);
	AI_Output(other,self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_01");	//Кажется, настало время проучить тебя!
	AI_Output(self,other,"Info_Erpresser_Choice_Zahlen_13_02");	//Вот не везет.
	GOPSTOPPED_BRIDGE = TRUE;
	self.aivar[AIV_HAS_ERPRESSED] = 2;
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
	npc_setpermattitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(coerpresser,hero);
	AI_StartState(coerpresser,zs_attack,1,"");
	npc_setpermattitude(coerpresser,ATT_HOSTILE);
	Npc_SetTempAttitude(coerpresser,ATT_HOSTILE);
	AI_StopProcessInfos(coerpresser);
};

func void info_erpresser_choice_zahlen()
{
	var C_NPC coerpresser;
	coerpresser = Hlp_GetNpc(org_889_coerpresser);
	AI_Output(other,self,"Info_Erpresser_Choice_Zahlen_15_01");	//Вот десять кусков.
	b_printtrademsg1("Отдано руды: 10");
	AI_Output(self,other,"Info_Erpresser_Choice_AufsMaul_13_02");	//Спасибо. Ты меня выручил.
	self.aivar[AIV_HAS_ERPRESSED] = 1;
	b_giveinvitems(other,self,itminugget,10);
	AI_StopProcessInfos(self);
};

func void info_erpresser_choice_noore()
{
	var C_NPC coerpresser;
	coerpresser = Hlp_GetNpc(org_889_coerpresser);
	AI_Output(other,self,"Info_Erpresser_Choice_Zahlen_15_03");	//Э... у меня сейчас нет десяти кусков...
	AI_Output(self,other,"Info_Erpresser_Choice_Zahlen_13_04");	//Какая жалость...
	GOPSTOPPED_BRIDGE = TRUE;
	self.aivar[AIV_HAS_ERPRESSED] = 2;
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
	npc_setpermattitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(coerpresser,hero);
	AI_StartState(coerpresser,zs_attack,1,"");
	npc_setpermattitude(coerpresser,ATT_HOSTILE);
	Npc_SetTempAttitude(coerpresser,ATT_HOSTILE);
	AI_StopProcessInfos(coerpresser);
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
	AI_StopProcessInfos(self);
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
	if((self.aivar[AIV_HAS_ERPRESSED] == 2) && (self.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return 1;
	};
};

func void info_bereitsaufsmaul_info()
{
	AI_Output(self,other,"Info_BereitsAufsMaul_Info_13_02");	//Пошел отсюда, пока я не рассердился!
	AI_StopProcessInfos(self);
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

