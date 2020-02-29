
instance DIA_ORG_876_EXIT(C_INFO)
{
	npc = org_876_tuersteher;
	nr = 999;
	condition = dia_org_876_exit_condition;
	information = dia_org_876_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_org_876_exit_condition()
{
	return 1;
};

func void dia_org_876_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORG_876_AMSFB(C_INFO)
{
	npc = org_876_tuersteher;
	nr = 1;
	condition = dia_org_876_amsfb_condition;
	information = dia_org_876_amsfb_info;
	permanent = 1;
	description = "� �������! � ������ � ���� ������ ����-������ ��������!";
};


func int dia_org_876_amsfb_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY))
	{
		return TRUE;
	};
};

func void dia_org_876_amsfb_info()
{
	var C_ITEM myarmor;
	AI_Output(other,self,"DIA_Org_876_AmSfb_15_00");	//� �������! � ������ � ���� ������ ����-������ ��������!
	myarmor = Npc_GetEquippedArmor(hero);
	if(Hlp_IsItem(myarmor,sfb_armor_l))
	{
		AI_Output(self,other,"DIA_Org_876_AmSfb_06_01");	//��, �� ����� �� ���� ������� ����������. ������ ������!
		self.aivar[AIV_PASSGATE] = TRUE;
		AI_StopProcessInfos(self);
	}
	else if(Hlp_IsItem(myarmor,vlk_armor_l) || Hlp_IsItem(myarmor,vlk_armor_m))
	{
		AI_Output(self,other,"SVM_6_WhatsThisSupposedToBe");	//��� ���� ����� �����? ��� �� ����������?
		AI_Output(self,other,"Info_Org_804_FirstWarn_Info_06_00");	//������������ ������ ���� ���������! �����!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Org_876_AmSfb_NOSFB_06_00");	//���-�� �� �� ����� �� ��������. ���� ���� ������!
		AI_StopProcessInfos(self);
	};
};


instance DIA_ORG_876_BRIBE(C_INFO)
{
	npc = org_876_tuersteher;
	nr = 1;
	condition = dia_org_876_bribe_condition;
	information = dia_org_876_bribe_info;
	permanent = 1;
	description = "� ���� � ��� ���� ������� ����?";
};


func int dia_org_876_bribe_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void dia_org_876_bribe_info()
{
	AI_Output(other,self,"DIA_Org_876_Bribe_15_00");	//� ���� � ��� ���� ������� ����?
	AI_Output(self,other,"DIA_Org_876_Bribe_06_01");	//� '�������' - ��� �������?
	Info_ClearChoices(dia_org_876_bribe);
	Info_AddChoice(dia_org_876_bribe,"����� ������ ���� ������?",dia_org_876_bribe_100erz);
	Info_AddChoice(dia_org_876_bribe,"��������� ������. �� ��������?",dia_org_876_bribe_50erz);
	Info_AddChoice(dia_org_876_bribe,"��, 10 ������.",dia_org_876_bribe_10erz);
};

func void dia_org_876_bribe_10erz()
{
	AI_Output(other,self,"DIA_Org_876_Bribe_10Erz_15_00");	//��, 10 ������.
	if(Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output(self,other,"DIA_Org_876_Bribe_10Erz_06_01");	//������ ������? �� ��� � ������� ���� ������� ������ �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Org_876_Bribe_10Erz_06_02");	//��? � ��� ��� ������ ������?
	};
	AI_StopProcessInfos(self);
};

func void dia_org_876_bribe_50erz()
{
	AI_Output(other,self,"DIA_Org_876_Bribe_50Erz_15_00");	//��������� ������. �� ��������?
	if(Npc_HasItems(other,itminugget) >= 50)
	{
		AI_Output(self,other,"DIA_Org_876_Bribe_50Erz_06_01");	//��, ��� ����� ���� �������� ����, ��� � ������� '������� ����'.
	}
	else
	{
		AI_Output(self,other,"DIA_Org_876_Bribe_50Erz_06_02");	//��? ���-�� � �� ���� ���������� ������.
	};
	AI_StopProcessInfos(self);
};

func void dia_org_876_bribe_100erz()
{
	AI_Output(other,self,"DIA_Org_876_Bribe_100Erz_15_00");	//����� ������ ���� ������?
	if(Npc_HasItems(other,itminugget) >= 100)
	{
		AI_Output(self,other,"DIA_Org_876_Bribe_100Erz_06_01");	//������ ������. �������.
		self.aivar[AIV_PASSGATE] = TRUE;
		b_giveinvitems(other,self,itminugget,100);
	}
	else
	{
		AI_Output(self,other,"DIA_Org_876_Bribe_100Erz_06_02");	//�������. ������ � ���� �� ���.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ORG_876_PERM(C_INFO)
{
	npc = org_876_tuersteher;
	nr = 1;
	condition = dia_org_876_perm_condition;
	information = dia_org_876_perm_info;
	permanent = 1;
	description = "��� ���� ���� �� �������?";
};


func int dia_org_876_perm_condition()
{
	if((self.aivar[AIV_PASSGATE] == TRUE) || (Npc_GetAttitude(self,hero) == ATT_FRIENDLY))
	{
		return 1;
	};
};

func void dia_org_876_perm_info()
{
	AI_Output(other,self,"DIA_Org_876_PERM_15_00");	//��� ���� ���� �� �������?
	AI_Output(self,other,"DIA_Org_876_PERM_06_01");	//����� � ������ ������. ��� �� �� ��� ����������.
};


instance DIA_ORG_876_SCSLD(C_INFO)
{
	npc = org_876_tuersteher;
	nr = 1;
	condition = dia_org_876_scsld_condition;
	information = dia_org_876_scsld_info;
	permanent = 0;
	important = 1;
};


func int dia_org_876_scsld_condition()
{
	if((other.guild == GIL_SLD) || (other.guild == GIL_KDW) || (other.guild == GIL_KDF) || (other.guild == GIL_DMB) || (other.guild == GIL_GUR))
	{
		return 1;
	};
};

func void dia_org_876_scsld_info()
{
	AI_Output(self,other,"DIA_Org_876_ScSld_06_00");	//����! �� �� ������ �������. ���� ����� ������ ������ ���� ��� ��������.
	AI_Output(other,self,"DIA_Org_876_ScSld_15_01");	//� �� ������ ���� ����������?
	AI_Output(self,other,"DIA_Org_876_ScSld_06_02");	//���... �����, �������...
	AI_StopProcessInfos(self);
	self.aivar[AIV_PASSGATE] = TRUE;
};


instance DIA_ORG_876_SCSEKTE(C_INFO)
{
	npc = org_876_tuersteher;
	nr = 1;
	condition = dia_org_876_scsekte_condition;
	information = dia_org_876_scsekte_info;
	permanent = 0;
	important = 1;
};


func int dia_org_876_scsekte_condition()
{
	if((other.guild == GIL_NOV) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		return 1;
	};
};

func void dia_org_876_scsekte_info()
{
	AI_Output(self,other,"DIA_Org_876_ScSekte_06_00");	//������ ���� ����� ������ ������ ����, ��, ��������� �� ���� �������.
	AI_Output(self,other,"DIA_Org_876_ScSekte_06_01");	//�������� ���� � ��� ���� � ����� ��������.
	self.aivar[AIV_PASSGATE] = TRUE;
};

var int org_876_gotjoint;

instance DIA_ORG_876_GIBKRAUT(C_INFO)
{
	npc = org_876_tuersteher;
	nr = 1;
	condition = dia_org_876_gibkraut_condition;
	information = dia_org_876_gibkraut_info;
	permanent = 1;
	description = "� � ���� ��� ��� ���� ��������. ��������!";
};


func int dia_org_876_gibkraut_condition()
{
	if(Npc_KnowsInfo(hero,dia_org_876_scsekte))
	{
		return 1;
	};
};

func void dia_org_876_gibkraut_info()
{
	AI_Output(other,self,"DIA_Org_876_GibKraut_15_00");	//� � ���� ��� ��� ���� ��������. ��������!
	if((Npc_HasItems(other,itmijoint_1) > 0) || (Npc_HasItems(other,itmijoint_2) > 0) || (Npc_HasItems(other,itmijoint_3) > 0))
	{
		if(Npc_HasItems(other,itmijoint_1))
		{
			b_giveinvitems(other,self,itmijoint_1,1);
		}
		else if(Npc_HasItems(other,itmijoint_2))
		{
			b_giveinvitems(other,self,itmijoint_2,1);
		}
		else if(Npc_HasItems(other,itmijoint_3))
		{
			b_giveinvitems(other,self,itmijoint_3,1);
		};
		AI_Output(self,other,"DIA_Org_876_GibKraut_06_01");	//������ ���� ������ ���� �����.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PASSGATE] = TRUE;
		ORG_876_GOTJOINT = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Org_876_GibKraut_KEIN_15_00");	//�... �������, ��-�����, �� ����������.
		AI_Output(self,other,"DIA_Org_876_GibKraut_KEIN_06_00");	//��� �����. �� ������ �������� ���� ������� � ��������� ���.
		self.aivar[AIV_PASSGATE] = TRUE;
	};
};


const string ORG_876_CHECKPOINT = "NC_TAVERN_BAR";

instance INFO_ORG_876_FIRSTWARN(C_INFO)
{
	npc = org_876_tuersteher;
	nr = 2;
	condition = info_org_876_firstwarn_condition;
	information = info_org_876_firstwarn_info;
	permanent = 1;
	important = 1;
};


func int info_org_876_firstwarn_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_org_876_firstwarn_info()
{
	printglobals(PD_MISSION);
	if(Npc_GetAttitude(self,hero) != ATT_FRIENDLY)
	{
		AI_Output(self,hero,"Info_Org_876_FirstWarn_Info_06_00");	//���� ��� �� ��������?
		AI_Output(hero,self,"Info_Org_876_FirstWarn_Info_15_01");	//����.
		AI_Output(self,hero,"Info_Org_876_FirstWarn_Info_06_02");	//� ��� ���� ���� ������. ���� ����� ��������� ������ ���� ��� ��������.
		hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,ORG_876_CHECKPOINT);
		hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	}
	else
	{
		AI_Output(self,other,"SVM_6_FriendlyGreetings");	//������, �������!
		self.aivar[AIV_PASSGATE] = TRUE;
		AI_StopProcessInfos(self);
	};
};


instance INFO_ORG_876_LASTWARN(C_INFO)
{
	npc = org_876_tuersteher;
	nr = 1;
	condition = info_org_876_lastwarn_condition;
	information = info_org_876_lastwarn_info;
	permanent = 1;
	important = 1;
};


func int info_org_876_lastwarn_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,ORG_876_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_org_876_lastwarn_info()
{
	AI_Output(self,hero,"Info_Org_876_LastWarn_06_00");	//� ���� �������� �� ������?
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,ORG_876_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance INFO_ORG_876_ATTACK(C_INFO)
{
	npc = org_876_tuersteher;
	nr = 1;
	condition = info_org_876_attack_condition;
	information = info_org_876_attack_info;
	permanent = 1;
	important = 1;
};


func int info_org_876_attack_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,ORG_876_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_org_876_attack_info()
{
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;
	b_fullstop(self);
	AI_StopProcessInfos(self);
	b_intruderalert(self,other);
	b_setattackreason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,zs_attack,1,"");
};

