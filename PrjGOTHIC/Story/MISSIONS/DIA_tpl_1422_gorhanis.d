
instance INFO_GORHANIS_EXIT(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 999;
	condition = info_gorhanis_exit_condition;
	information = info_gorhanis_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_gorhanis_exit_condition()
{
	return 1;
};

func void info_gorhanis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_GORHANIS_WHAT(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 1;
	condition = info_gorhanis_what_condition;
	information = info_gorhanis_what_info;
	permanent = 0;
	description = "��� �� ����� �������?";
};


func int info_gorhanis_what_condition()
{
	return 1;
};

func void info_gorhanis_what_info()
{
	AI_Output(other,self,"Info_GorHanis_What_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"Info_GorHanis_What_08_01");	//�? � �������� �� ����� �������!
};


instance INFO_GORHANIS_ARENA(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 1;
	condition = info_gorhanis_arena_condition;
	information = info_gorhanis_arena_info;
	permanent = 0;
	description = "�� ���������� �� �����?";
};


func int info_gorhanis_arena_condition()
{
	if(Npc_KnowsInfo(self,info_gorhanis_what))
	{
		return 1;
	};
};

func void info_gorhanis_arena_info()
{
	AI_Output(other,self,"Info_GorHanis_Arena_15_00");	//�� ���������� �� �����?
	AI_Output(self,other,"Info_GorHanis_Arena_08_01");	//��� ������� �� �������� �������� ���� ���� ��������� �� ����� �������.
	AI_Output(self,other,"Info_GorHanis_Arena_08_02");	//� ���������� ���� �����, ����� �������� ��������, ����� ����� ���� ������� ������!
};


instance INFO_GORHANIS_SLEEPER(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 2;
	condition = info_gorhanis_sleeper_condition;
	information = info_gorhanis_sleeper_info;
	permanent = 0;
	description = "��� ��, ���� ������?";
};


func int info_gorhanis_sleeper_condition()
{
	if(Npc_KnowsInfo(self,info_gorhanis_what))
	{
		return 1;
	};
};

func void info_gorhanis_sleeper_info()
{
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_00");	//��� ��, ���� ������?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_01");	//� ����� ������ �� ������� ������, ������� ������ ���������� ���� ������, ��� �.
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_02");	//���� ������� ���� ������, ��� ������ ������ ����� ����������. �� ������ ��� ���� � �� �� ������� ��� ������.
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_03");	//�� ������ �������, ��� ���� ��� ��������� ��� ������?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_04");	//��! � ����� ���� �������� ����������. ��� ���� ������������� � ������� ���������.
};


instance INFO_GORHANIS_SUMMONING(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 2;
	condition = info_gorhanis_summoning_condition;
	information = info_gorhanis_summoning_info;
	permanent = 0;
	description = "�� ������ ���������� � ���������?";
};


func int info_gorhanis_summoning_condition()
{
	if(Npc_KnowsInfo(self,info_gorhanis_sleeper))
	{
		return 1;
	};
};

func void info_gorhanis_summoning_info()
{
	AI_Output(other,self,"Info_GorHanis_Summoning_15_00");	//�� ������ ���������� � ���������?
	AI_Output(self,other,"Info_GorHanis_Summoning_08_01");	//���� ������� �������, ��� �� ������� ��������� �� ������ ��������� �������, � �� ��� ���� ���� � �������!
	AI_Output(self,other,"Info_GorHanis_Summoning_08_02");	//���� �� ������ ������ ������, ��� � ��� ������.
};


instance INFO_GORHANIS_WAYTOST(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 0;
	condition = info_gorhanis_waytost_condition;
	information = info_gorhanis_waytost_info;
	permanent = 0;
	description = "��� � ����� ������ � ������ ������?";
};


func int info_gorhanis_waytost_condition()
{
	if(Npc_KnowsInfo(hero,info_gorhanis_sleeper) || Npc_KnowsInfo(hero,info_gorhanis_summoning))
	{
		return 1;
	};
};

func void info_gorhanis_waytost_info()
{
	AI_Output(other,self,"Info_GorHanis_WayToST_15_00");	//��� � ����� ������ � ������ ������?
	AI_Output(self,other,"Info_GorHanis_WayToST_08_01");	//� ������ ������ ������ ����� ����� ��������� ����� �����������, ������� ��������� �������������� � ��� ������. ����� ����-������ �� ���!
};


instance INFO_GORHANIS_CHARGE(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 3;
	condition = info_gorhanis_charge_condition;
	information = info_gorhanis_charge_info;
	permanent = 0;
	description = "� ���� ��������� � ����� �� �����!";
};


func int info_gorhanis_charge_condition()
{
	if(Npc_KnowsInfo(hero,info_gorhanis_arena))
	{
		return 1;
	};
};

func void info_gorhanis_charge_info()
{
	AI_Output(other,self,"Info_GorHanis_Charge_15_00");	//� ���� ��������� � ����� �� �����!
	if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output(self,other,"Info_GorHanis_Charge_08_01");	//�������� ����� �������� ����� ������ �������� �� �������� ����� �������.
		AI_Output(self,other,"Info_GorHanis_Charge_08_02");	//� ����� ��������� � ����� ������ �����, ����� �� ������ ��������� �����������.
		AI_Output(self,other,"Info_GorHanis_Charge_08_03");	//�� � ������, ��� ����� �� ������� ��� ������ ������� �� ��������� �� ������ �����������. ��� �� ���������� �������� ���������� ����������.
	}
	else
	{
		if(Wld_IsTime(18,30,23,10))
		{
			AI_Output(self,other,"SVM_8_NotNow");	//������ �� �����.
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"SVM_8_NoLearnYoureBetter");	//������ �� �����!
			AI_StopProcessInfos(self);
			HANIS_CHARGED = TRUE;
			self.attribute[ATR_HITPOINTS] = 280;
			self.attribute[ATR_HITPOINTS_MAX] = 280;
			Npc_ExchangeRoutine(self,"GUIDE");
			b_fullstop(grd_251_kirgo);
			b_fullstop(sld_729_kharim);
			b_exchangeroutine(grd_251_kirgo,"nopractice");
			b_exchangeroutine(sld_729_kharim,"nopractice");
		};
	};
};


instance INFO_GORHANIS_CHARGEGOOD(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 3;
	condition = info_gorhanis_chargegood_condition;
	information = info_gorhanis_chargegood_info;
	permanent = 1;
	description = "� ������ ���� ���� ����������, ����� ��������� � �����?";
};


func int info_gorhanis_chargegood_condition()
{
	if(Npc_KnowsInfo(hero,info_gorhanis_charge) && (!Npc_IsDead(sld_729_kharim) && !Npc_IsDead(grd_251_kirgo)) && (HANIS_CHARGED != TRUE))
	{
		return 1;
	};
};

func void info_gorhanis_chargegood_info()
{
	AI_Output(other,self,"Info_GorHanis_ChargeGood_15_00");	//� ������ ���� ���� ����������, ����� ��������� � �����?
	if(Wld_IsTime(18,30,23,10))
	{
		AI_Output(self,other,"SVM_8_NotNow");	//������ �� �����.
		AI_StopProcessInfos(self);
	}
	else if(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output(self,other,"Info_GorHanis_ChargeGood_08_01");	//���! �� ��� ������������ �����. �� �� ������ ���� ���� �����������!
	}
	else
	{
		AI_Output(self,other,"SVM_8_NoLearnYoureBetter");	//������ �� �����!
		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
			CreateInvItem(self,itfo_potion_health_03);
			AI_UseItem(self,itfo_potion_health_03);
		};
		AI_StopProcessInfos(self);
		HANIS_CHARGED = TRUE;
		Npc_ExchangeRoutine(self,"GUIDE");
		b_fullstop(grd_251_kirgo);
		b_fullstop(sld_729_kharim);
		b_exchangeroutine(grd_251_kirgo,"nopractice");
		b_exchangeroutine(sld_729_kharim,"nopractice");
	};
};


instance INFO_GORHANIS_INARENA(C_INFO)
{
	npc = tpl_1422_gorhanis;
	nr = 1;
	condition = info_gorhanis_inarena_condition;
	information = info_gorhanis_inarena_info;
	permanent = 0;
	important = 1;
};


func int info_gorhanis_inarena_condition()
{
	if((HANIS_CHARGED == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 600))
	{
		return 1;
	};
};

func void info_gorhanis_inarena_info()
{
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		CreateInvItem(self,itfo_potion_health_03);
		AI_UseItem(self,itfo_potion_health_03);
	};
	if(!Npc_HasItems(self,itmw_gorhanis) && !Npc_HasItems(self,itmw_1h_sword_01))
	{
		CreateInvItem(self,itmw_1h_sword_01);
		AI_EquipBestMeleeWeapon(self);
	};
	AI_Output(self,other,"Info_TPL_1455_GorBoba1_08_05");	//����������� � ������� � ����������!
	b_clearimmortal(self);
	Wld_SendUntrigger("OC_ARENA_GATE");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	b_exchangeroutine(grd_251_kirgo,"START");
	b_exchangeroutine(sld_729_kharim,"START");
	b_exchangeroutine(grd_998_gardist,"wait");
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
	HANIS_CHARGED_END = TRUE;
	PLAYERINARENA = TRUE;
};

