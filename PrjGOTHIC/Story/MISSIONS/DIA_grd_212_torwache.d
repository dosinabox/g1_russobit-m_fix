
const string GRD_212_CHECKPOINT = "OCC_GATE_INSIDE";

instance INFO_GRD_212_FIRSTWARN(C_INFO)
{
	npc = grd_212_torwache;
	nr = 1;
	condition = info_grd_212_firstwarn_condition;
	information = info_grd_212_firstwarn_info;
	permanent = 1;
	important = 1;
};


func int info_grd_212_firstwarn_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_grd_212_firstwarn_info()
{
	printglobals(PD_MISSION);
	AI_Output(self,hero,"Info_Grd_212_FirstWarn_Info_13_01");	//����!
	AI_Output(hero,self,"Info_Grd_212_FirstWarn_Info_15_02");	//� ��� ����?
	AI_Output(self,hero,"Info_Grd_212_FirstWarn_Info_13_03");	//� ����� ������ ������� ��� ����������. �������� ������!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,GRD_212_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	AI_StopProcessInfos(self);
};


instance INFO_GRD_212_LASTWARN(C_INFO)
{
	npc = grd_212_torwache;
	nr = 1;
	condition = info_grd_212_lastwarn_condition;
	information = info_grd_212_lastwarn_info;
	permanent = 1;
	important = 1;
};


func int info_grd_212_lastwarn_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,GRD_212_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int info_grd_212_lastwarn_info()
{
	AI_Output(self,hero,"Info_Grd_212_LastWarn_13_01");	//�� ���, �����? ��� ���, � � ������ ���� �� �����.
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,GRD_212_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance INFO_GRD_212_ATTACK(C_INFO)
{
	npc = grd_212_torwache;
	nr = 1;
	condition = info_grd_212_attack_condition;
	information = info_grd_212_attack_info;
	permanent = 1;
	important = 1;
};


func int info_grd_212_attack_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,GRD_212_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int info_grd_212_attack_info()
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


instance INFO_GRD_212_EXIT(C_INFO)
{
	npc = grd_212_torwache;
	nr = 999;
	condition = info_grd_212_exit_condition;
	information = info_grd_212_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_grd_212_exit_condition()
{
	return 1;
};

func void info_grd_212_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_GRD_212_ABBLITZEN(C_INFO)
{
	npc = grd_212_torwache;
	nr = 1;
	condition = info_grd_212_abblitzen_condition;
	information = info_grd_212_abblitzen_info;
	permanent = 1;
	description = "� ���� ������� � �����!";
};


func int info_grd_212_abblitzen_condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return 1;
	};
};

func void info_grd_212_abblitzen_info()
{
	AI_Output(other,self,"Info_Grd_212_Abblitzen_15_00");	//� ���� ������� � �����!
	AI_Output(self,other,"Info_Grd_212_Abblitzen_13_01");	//��, ��� ���������! � ��� ������� �������� ������ ��������!
	AI_Output(self,other,"Info_Grd_212_Abblitzen_13_02");	//�, �� �������, � ���� ���� � ������ ����, ����� ��� ������� �� ����, ��� �������� ������� � �����.
	AI_Output(other,self,"Info_Grd_212_Abblitzen_15_03");	//�� ������ ���������� ����...
	AI_Output(self,other,"Info_Grd_212_Abblitzen_13_04");	//���, �� ����! �������� � �������.
	AI_StopProcessInfos(self);
};


instance INFO_GRD_212_FIRSTIN(C_INFO)
{
	npc = grd_212_torwache;
	nr = 1;
	condition = info_grd_212_firstin_condition;
	information = info_grd_212_firstin_info;
	permanent = 0;
	important = 1;
};


func int info_grd_212_firstin_condition()
{
	if(self.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

func void info_grd_212_firstin_info()
{
	AI_Output(self,other,"Info_Grd_212_FirstIn_13_00");	//����!
	AI_Output(other,self,"Info_Grd_212_FirstIn_15_01");	//�� �����, � ��������� � �������. �� �������� ��� �����.
	AI_Output(self,other,"Info_Grd_212_FirstIn_13_02");	//� ������� ���� ����. ���� �� �������� ���� ���� ������, ���� �� ����������!
	AI_StopProcessInfos(self);
};


instance INFO_GRD_212_PASSGATE(C_INFO)
{
	npc = grd_212_torwache;
	nr = 1;
	condition = info_grd_212_passgate_condition;
	information = info_grd_212_passgate_info;
	permanent = 1;
	description = "� ���� �����?";
};


func int info_grd_212_passgate_condition()
{
	if(self.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

func void info_grd_212_passgate_info()
{
	AI_Output(other,self,"Info_Grd_212_Passgate_15_00");	//� ���� �����?
	AI_Output(self,other,"Info_Grd_212_Passgate_13_01");	//��� ���� ������, � � �� ����� ������� ���� �� �����.
	AI_StopProcessInfos(self);
};

