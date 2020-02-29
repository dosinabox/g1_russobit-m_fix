
instance DIA_GRD_214_TORWACHE_EXIT(C_INFO)
{
	npc = grd_214_torwache;
	nr = 999;
	condition = dia_grd_214_torwache_exit_condition;
	information = dia_grd_214_torwache_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_grd_214_torwache_exit_condition()
{
	return 1;
};

func void dia_grd_214_torwache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRD_214_TORWACHE_JOB(C_INFO)
{
	npc = grd_214_torwache;
	nr = 2;
	condition = dia_grd_214_torwache_job_condition;
	information = dia_grd_214_torwache_job_info;
	permanent = 1;
	description = "��� �� ����� �������?";
};


func int dia_grd_214_torwache_job_condition()
{
	return 1;
};

func void dia_grd_214_torwache_job_info()
{
	AI_Output(other,self,"DIA_Grd_214_Torwache_job_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Grd_214_Torwache_job_07_01");	//������� ����� �� ������ �������� ������, ������� ����� �������� ������.
	AI_Output(self,other,"DIA_Grd_214_Torwache_job_07_02");	//��� ��� ���� ����� �� ������ ���������, ����� ��������� ������, ����� ���� ������ ����� ���� �� ���������.
};


instance GRD_214_TORWACHE_SEETHORUS(C_INFO)
{
	npc = grd_214_torwache;
	condition = grd_214_torwache_seethorus_condition;
	information = grd_214_torwache_seethorus_info;
	important = 1;
	permanent = 0;
};


func int grd_214_torwache_seethorus_condition()
{
	if(!Npc_KnowsInfo(hero,grd_216_torwache_seethorus) && ((CORKALOM_BRINGMCQBALLS == LOG_SUCCESS) || (Npc_HasItems(hero,itat_crawlerqueen) >= 3)) && !Npc_KnowsInfo(hero,grd_200_thorus_gardist) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return TRUE;
	};
};

func void grd_214_torwache_seethorus_info()
{
	AI_Output(self,other,"Grd_214_Torwache_SEETHORUS_Info_07_01");	//��, ������, ��� �� ������. ����� ����� ���������� � �����!
	AI_Output(other,self,"Grd_214_Torwache_SEETHORUS_Info_15_02");	//� ��� ��� �����?
	AI_Output(self,other,"Grd_214_Torwache_SEETHORUS_Info_07_03");	//�� ��� ��������� ���� �� ����.
};


instance GRD_214_TORWACHE_NODUSTY(C_INFO)
{
	npc = grd_214_torwache;
	condition = grd_214_torwache_nodusty_condition;
	information = grd_214_torwache_nodusty_info;
	important = 1;
	permanent = 1;
};


func int grd_214_torwache_nodusty_condition()
{
	var C_NPC dusty;
	dusty = Hlp_GetNpc(vlk_524_dusty);
	if((dusty.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToNpc(hero,dusty) < 2000))
	{
		return TRUE;
	};
};

func void grd_214_torwache_nodusty_info()
{
	var C_NPC dusty;
	AI_Output(self,other,"Grd_214_Torwache_NODUSTY_Info_07_01");	//��, ��! �������, �� �� ����������� ������� ����� �� ������?
	AI_Output(other,self,"Grd_214_Torwache_NODUSTY_Info_15_02");	//�� ������ ������...
	AI_Output(self,other,"Grd_214_Torwache_NODUSTY_Info_07_03");	//����� ����� �� ��� ������ ������ �� ������!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
	b_exchangeroutine(vlk_524_dusty,"start");
	dusty = Hlp_GetNpc(vlk_524_dusty);
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;
};

