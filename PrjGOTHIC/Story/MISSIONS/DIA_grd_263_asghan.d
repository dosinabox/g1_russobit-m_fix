
instance GRD_263_ASGHAN_EXIT(C_INFO)
{
	npc = grd_263_asghan;
	nr = 999;
	condition = grd_263_asghan_exit_condition;
	information = grd_263_asghan_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int grd_263_asghan_exit_condition()
{
	return 1;
};

func void grd_263_asghan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance GRD_263_ASGHAN_NEST(C_INFO)
{
	npc = grd_263_asghan;
	condition = grd_263_asghan_nest_condition;
	information = grd_263_asghan_nest_info;
	important = 0;
	permanent = 0;
	description = "���-�� ����� ������ ���� ������ ��������.";
};


func int grd_263_asghan_nest_condition()
{
	if(CORKALOM_BRINGMCQBALLS == LOG_RUNNING)
	{
		return 1;
	};
};

func void grd_263_asghan_nest_info()
{
	AI_Output(other,self,"Grd_263_Asghan_NEST_Info_15_01");	//���-�� ����� ������ ���� ������ ��������.
	AI_Output(self,other,"Grd_263_Asghan_NEST_Info_06_02");	//��, ��� ���� � ���� ���� ������� ������ ��������!
	AI_Output(other,self,"Grd_263_Asghan_NEST_Info_15_03");	//������ ��� ����� ���������?
	AI_Output(self,other,"Grd_263_Asghan_NEST_Info_06_04");	//�������� ��������� ������� �����, ������� �� �� �� �� ����.
	AI_Output(other,self,"Grd_263_Asghan_NEST_Info_15_05");	//�������, ������ ������ ���� ���-�� ��������. ������ ��� ���� ��� ������!
	AI_Output(self,other,"Grd_263_Asghan_NEST_Info_06_06");	//���! �� ����� ������� ������ � ���������� ���! ��� ��� ������� � ���� � ����� �� ��������.
	b_logentry(CH2_MCEGGS,"������, ����� ���������� �����, ������������ ��������� ��� ������. �� �����, ����� � ������� � ��� ���������� �� ���.");
};


instance GRD_263_ASGHAN_OPEN(C_INFO)
{
	npc = grd_263_asghan;
	condition = grd_263_asghan_open_condition;
	information = grd_263_asghan_open_info;
	important = 0;
	permanent = 0;
	description = "��, ������, �� ������ ������� ������!";
};


func int grd_263_asghan_open_condition()
{
	if(Npc_KnowsInfo(hero,grd_263_asghan_nest) && Npc_KnowsInfo(hero,stt_301_ian_gear_suc))
	{
		return TRUE;
	};
};

func void grd_263_asghan_open_info()
{
	AI_Output(other,self,"Grd_263_Asghan_OPEN_Info_15_01");	//��, ������, �� ������ ������� ������!
	AI_Output(self,other,"Grd_263_Asghan_OPEN_Info_06_02");	//� ��� ������: ������ � ���������� ���...
	AI_Output(other,self,"Grd_263_Asghan_OPEN_Info_15_03");	//������... ��� ����� � �������... � ������ ���� �� ���.
	AI_Output(self,other,"Grd_263_Asghan_OPEN_Info_06_04");	//��, ���� �� �������� �� ��� ��������... �� ���� ���� �������!
	AI_Output(other,self,"Grd_263_Asghan_OPEN_Info_15_05");	//� ��� ��� �� �������?
	AI_Output(self,other,"Grd_263_Asghan_OPEN_Info_06_06");	//��� ����� ������. ����-���� ������� ����� ����������. � �� �� ������� �������������� ���� ���� �������� � �����������!
	b_logentry(CH2_MCEGGS,"�� �������� ��� ����� � ����������� ����� �����. �� ��� ����� ��� ���������� ���������� ���������� �������. ����� ������ ������� ��� ������.");
	AI_StopProcessInfos(self);
};


instance GRD_263_ASGHAN_OPEN_NOW(C_INFO)
{
	npc = grd_263_asghan;
	condition = grd_263_asghan_open_now_condition;
	information = grd_263_asghan_open_now_info;
	important = 0;
	permanent = 0;
	description = "������ ��� ������. ����� ������� ������!";
};


func int grd_263_asghan_open_now_condition()
{
	if((Npc_KnowsInfo(hero,tpl_1400_gornabar_suggest) && Npc_KnowsInfo(hero,tpl_1401_gornakosh_suggest)) || (Npc_KnowsInfo(hero,tpl_1401_gornakosh_suggest) && Npc_KnowsInfo(hero,tpl_1433_gornavid_health_suc)) || (Npc_KnowsInfo(hero,tpl_1433_gornavid_health_suc) && Npc_KnowsInfo(hero,tpl_1400_gornabar_suggest)))
	{
		return TRUE;
	};
};

func void grd_263_asghan_open_now_info()
{
	var C_NPC sklave;
	AI_Output(other,self,"Grd_263_Asghan_OPEN_NOW_Info_15_01");	//������ ��� ������. ����� ������� ������!
	AI_Output(self,other,"Grd_263_Asghan_OPEN_NOW_Info_06_02");	//�����, ��������. ������������� ����������!
	npc_setpermattitude(self,ATT_FRIENDLY);
	Npc_ExchangeRoutine(self,"opengate");
	b_givexp(XP_OPENASGHANSGATE);
	b_logentry(CH2_MCEGGS,"� ������ ���������� ������� � ����� � ����������� ����� �����. ��� ���� ��� �������?");
	sklave = Hlp_GetNpc(orc_2001_sklave);
	Npc_ExchangeRoutine(sklave,"STOMPER");
	AI_ContinueRoutine(sklave);
	AI_StopProcessInfos(self);
	Snd_Play("AMBIENTCRAWLERSCREAM");
};


instance GRD_263_ASGHAN_LAIRFOUND(C_INFO)
{
	npc = grd_263_asghan;
	condition = grd_263_asghan_lairfound_condition;
	information = grd_263_asghan_lairfound_info;
	important = 0;
	permanent = 0;
	description = "������� ������ �� ����� �������� ���������!";
};


func int grd_263_asghan_lairfound_condition()
{
	MINECRAWLERQUEEN = Hlp_GetNpc(minecrawlerqueen);
	if((Npc_HasItems(hero,itat_crawlerqueen) >= 3) && (Npc_GetTrueGuild(hero) == GIL_STT) && Npc_IsDead(minecrawlerqueen))
	{
		return TRUE;
	};
};

func void grd_263_asghan_lairfound_info()
{
	AI_Output(other,self,"Grd_263_Asghan_LAIRFOUND_Info_15_01");	//������� ������ �� ����� �������� ���������!
	AI_Output(self,other,"Grd_263_Asghan_LAIRFOUND_Info_06_02");	//�������� �������. ���� �������� ��� ������!
	AI_StopProcessInfos(self);
};


instance GRD_263_ASGHAN_SMALLTALK(C_INFO)
{
	npc = grd_263_asghan;
	condition = grd_263_asghan_smalltalk_condition;
	information = grd_263_asghan_smalltalk_info;
	important = 0;
	permanent = 0;
	description = "��, ��� ����?";
};


func int grd_263_asghan_smalltalk_condition()
{
	if(CORKALOM_BRINGMCQBALLS != LOG_RUNNING)
	{
		return TRUE;
	};
};

func void grd_263_asghan_smalltalk_info()
{
	AI_Output(other,self,"Grd_263_Asghan_SMALLTALK_Info_15_01");	//��, ��� ����?
	AI_Output(self,other,"Grd_263_Asghan_SMALLTALK_Info_06_02");	//������... ���� ����� �� ��������� ��������� �������� � ��� �� ���� ������ ��������.
	AI_Output(other,self,"Grd_263_Asghan_SMALLTALK_Info_15_03");	//� ��� �� ���������� �� ����� ��������?
	AI_Output(self,other,"Grd_263_Asghan_SMALLTALK_Info_06_04");	//�������. ��������, ������� �������. � �� ����� �����, ����� �����.
};

