
instance INFO_KHARIM_EXIT(C_INFO)
{
	npc = sld_729_kharim;
	nr = 999;
	condition = info_kharim_exit_condition;
	information = info_kharim_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_kharim_exit_condition()
{
	return 1;
};

func void info_kharim_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_KHARIM_WHAT(C_INFO)
{
	npc = sld_729_kharim;
	nr = 1;
	condition = info_kharim_what_condition;
	information = info_kharim_what_info;
	permanent = 0;
	description = "� ����� �������. �����, ��� ��?";
};


func int info_kharim_what_condition()
{
	return 1;
};

func void info_kharim_what_info()
{
	AI_Output(other,self,"Info_Kharim_What_15_00");	//� ����� �������. �����, ��� ��?
	AI_Output(self,other,"Info_Kharim_What_09_01");	//� �����. ��������, �� ������ ���� �������, ����� �� �� ��� ���� ����.
	AI_Output(self,other,"Info_Kharim_What_09_02");	//� ������ ���� �� ����, ���� ����������� � ���� ������.
};


var C_NPC ARENA_FIGHTER_2;
instance INFO_KHARIM_CHARGE(C_INFO)
{
	npc = sld_729_kharim;
	nr = 2;
	condition = info_kharim_charge_condition;
	information = info_kharim_charge_info;
	permanent = 1;
	description = "� ������� ���� �� ���! ������, �������� �� �����!";
};


func int info_kharim_charge_condition()
{
	if(Npc_KnowsInfo(hero,dia_scatty_joinoc) && (!Npc_IsDead(tpl_1422_gorhanis) && !Npc_IsDead(grd_251_kirgo)) && Npc_KnowsInfo(hero,info_kharim_what) && (KHARIM_CHARGED != TRUE) && (Npc_GetTrueGuild(hero) == GIL_NONE) && ((KIRGO_CHARGED != TRUE) || (KIRGO_CHARGED_END == TRUE)))
	{
		return 1;
	};
};

func void info_kharim_charge_info()
{
	AI_Output(other,self,"Info_Kharim_Charge_15_00");	//� ������� ���� �� ���! ������, �������� �� �����!
	if(Wld_IsTime(18,30,23,10))
	{
		AI_Output(self,other,"SVM_9_NotNow");	//���, �� ������.
		AI_StopProcessInfos(self);
	}
	else
	{		
		AI_Output(self,other,"Info_Kharim_Charge_09_01");	//��?! �� � �� ���� ������� ����� �� �������!
		AI_Output(self,other,"Info_Kharim_Charge_09_02");	//����� ������ �� ���� � �����, ���� � �� ���������!
		Info_ClearChoices(info_kharim_charge);
		Info_AddChoice(info_kharim_charge,"������, ������, � ��� ����� ��� �����.",info_kharim_charge_back);
		Info_AddChoice(info_kharim_charge,"��� �� �� ���������� �����, ����?!",info_kharim_charge_insult);
	};
};

func void info_kharim_charge_back()
{
	AI_Output(other,self,"Info_Kharim_Charge_BACK_15_00");	//������, ������, � ��� ����� ��� �����.
	AI_StopProcessInfos(self);
};

func void info_kharim_charge_insult()
{
	AI_Output(other,self,"Info_Kharim_Charge_Insult_15_00");	//��� �� �� ���������� �����, ����?!
	AI_Output(self,other,"Info_Kharim_Charge_Insult_09_01");	//�������� ���-������ �������!
	Info_ClearChoices(info_kharim_charge);
	Info_AddChoice(info_kharim_charge,"�� ������ �������� ���� ����������� ����� �������!",info_kharim_charge_insult_gomezass);
	Info_AddChoice(info_kharim_charge,"����� ��� ��� ���� �������: ���� ���� ���� ������ �� ����...",info_kharim_charge_insult_goats);
	Info_AddChoice(info_kharim_charge,"� �� ���� ��������� ������, ��� ���� �� �������� ������ ������.",info_kharim_charge_insult_stupid);
	Info_AddChoice(info_kharim_charge,"���� ����� ����� �� ���� �� � ����� ��������� � ����� �����.",info_kharim_charge_insult_face);
	Info_AddChoice(info_kharim_charge,"������, ������, � ��� ����� ��� �����.",info_kharim_charge_back);
};

func void info_kharim_charge_insult_goats()
{
	AI_Output(other,self,"Info_Kharim_Charge_Insult_Goats_15_00");	//����� ��� ��� ���� �������: ���� ���� ���� ������ �� ����...
	AI_Output(self,other,"Info_Kharim_Charge_Insult_Goats_09_01");	//�������, �� �� ������...
};

func void info_kharim_charge_insult_gomezass()
{
	AI_Output(other,self,"Info_Kharim_Charge_Insult_GomezAss_15_00");	//�� ������ �������� ���� ����������� ����� �������!
	AI_Output(self,other,"Info_Kharim_Charge_Insult_GomezAss_09_01");	//���?! �� ��, ������! �� �� ������ � ��� �� ������! ����� ������ �� ����������� ����� �������!
	AI_Output(self,other,"Info_Kharim_Charge_Insult_GomezAss_09_02");	//�, ����� ����, � ����� �� ����� �������: ��� ������� �������� ���� �� ����� �������, ��� ��!
	AI_Output(self,other,"Info_Kharim_Charge_Insult_GomezAss_09_03");	//� ������������� ����� ���� ��� ������! ����� ���� ���!
	KHARIM_CHARGED = TRUE;
	self.attribute[ATR_HITPOINTS] = 172;
	self.attribute[ATR_HITPOINTS_MAX] = 172;
	Info_ClearChoices(info_kharim_charge);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDE");
	b_fullstop(grd_251_kirgo);
	b_fullstop(tpl_1422_gorhanis);
	b_exchangeroutine(grd_251_kirgo,"nopractice");
	b_exchangeroutine(tpl_1422_gorhanis,"nopractice");
};

func void info_kharim_charge_insult_stupid()
{
	AI_Output(other,self,"Info_Kharim_Charge_Insult_Stupid_15_00");	//�������� ������: � �� ���� ��������� ������ ������, ��� ���� �� �������� ������ ������.
	AI_Output(self,other,"Info_Kharim_Charge_Insult_Stupid_09_01");	//����� ����, ���� ����� ����������� ��� ���?
};

func void info_kharim_charge_insult_face()
{
	AI_Output(other,self,"Info_Kharim_Charge_Insult_Face_15_00");	//��, ������� � ����� �������� �������� �������� �� ���� ����� �����, �� ����� � ������ ���� ������� ����.
	AI_Output(self,other,"Info_Kharim_Charge_Insult_Face_09_01");	//�����, � ��� ���� ��� ���� ���� �������� ������ ��� ����� �������!
};


instance INFO_KHARIM_INARENA(C_INFO)
{
	npc = sld_729_kharim;
	nr = 1;
	condition = info_kharim_inarena_condition;
	information = info_kharim_inarena_info;
	permanent = 0;
	important = 1;
};


func int info_kharim_inarena_condition()
{
	if((KHARIM_CHARGED == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 600))
	{
		return 1;
	};
};

func void info_kharim_inarena_info()
{
	if(!Npc_HasItems(self,itmw_kharim) && !Npc_HasItems(self,itmw_1h_sword_01))
	{
		CreateInvItem(self,itmw_1h_sword_01);
		AI_EquipBestMeleeWeapon(self);
	};
	AI_Output(self,other,"Info_Kharim_InArena_09_00");	//���� - ��� ��������� ���� ����!
	b_clearimmortal(self);
	Wld_SendUntrigger("OC_ARENA_GATE");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	b_exchangeroutine(tpl_1422_gorhanis,"START");
	b_exchangeroutine(grd_251_kirgo,"START");
	b_exchangeroutine(grd_998_gardist,"wait");
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
	KHARIM_CHARGED_END = TRUE;
	PLAYERINARENA = TRUE;
};

