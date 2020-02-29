
instance DIA_GRD_216_EXIT(C_INFO)
{
	npc = grd_216_torwache;
	nr = 999;
	condition = dia_grd_216_exit_condition;
	information = dia_grd_216_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_grd_216_exit_condition()
{
	return 1;
};

func void dia_grd_216_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRD_216_FIRST(C_INFO)
{
	npc = grd_216_torwache;
	nr = 1;
	condition = dia_grd_216_first_condition;
	information = dia_grd_216_first_info;
	permanent = 0;
	important = 1;
};


func int dia_grd_216_first_condition()
{
	var C_NPC dusty;
	if(Npc_GetDistToWP(other,"OCR_NORTHGATE_ADVANCE") > 400)
	{
		Npc_SetRefuseTalk(self,30);
	};
	if(Npc_RefuseTalk(self) == FALSE)
	{
		dusty = Hlp_GetNpc(vlk_524_dusty);
		if((dusty.aivar[AIV_PARTYMEMBER] == FALSE) && (KAPITEL < 2))
		{
			return 1;
		};
	};
};

func void dia_grd_216_first_info()
{
	AI_Output(self,other,"DIA_Grd_216_First_13_00");	//��, ��! � ���� ������ ����� �� �����!
	AI_Output(other,self,"DIA_Grd_216_First_15_01");	//��� ��. ���� ������� ���� ���������.
	AI_Output(self,other,"DIA_Grd_216_First_13_02");	//���� ���������. �� ��������� ������ ����� ������. ������ � ������ ���� ������ ��������.
};


instance DIA_GRD_216_DUSTYZOLL(C_INFO)
{
	npc = grd_216_torwache;
	nr = 1;
	condition = dia_grd_216_dustyzoll_condition;
	information = dia_grd_216_dustyzoll_info;
	permanent = 1;
	important = 1;
};


func int dia_grd_216_dustyzoll_condition()
{
	var C_NPC dusty;
	dusty = Hlp_GetNpc(vlk_524_dusty);
	if((dusty.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToNpc(hero,dusty) < 2000))
	{
		return 1;
	};
};

func void dia_grd_216_dustyzoll_info()
{
	AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_13_00");	//������! � ���� ��� �� ������������� � ����� ������?
	Info_ClearChoices(dia_grd_216_dustyzoll);
	Info_AddChoice(dia_grd_216_dustyzoll,"��� ���� ����� �� ��������!",dia_grd_216_dustyzoll_pissoff);
	Info_AddChoice(dia_grd_216_dustyzoll,"�� ����� ����� � ������ ��������.",dia_grd_216_dustyzoll_topsi);
	if(Npc_HasItems(other,itminugget) >= 100)
	{
		Info_AddChoice(dia_grd_216_dustyzoll,"�� ������ ����� �����������. � ��� ���� �� ��� ��������� �������.",dia_grd_216_dustyzoll_littlewalk);
	};
};

func void dia_grd_216_dustyzoll_pissoff()
{
	var C_NPC dusty;
	AI_Output(other,self,"DIA_Grd_216_Dusty_Zoll_PissOff_15_00");	//��� ���� ����� �� ��������!
	AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_PIssOff_13_00");	//� ��� �� �����!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
	b_exchangeroutine(vlk_524_dusty,"start");
	dusty = Hlp_GetNpc(vlk_524_dusty);
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;
};

func void dia_grd_216_dustyzoll_topsi()
{
	var C_NPC dusty;
	AI_Output(other,self,"DIA_Grd_216_Dusty_Zoll_ToPsi_15_00");	//�� ����� ����� � ������ ��������.
	AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_ToPsi_13_00");	//��, ��� ���� ������ �������...
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_attack,1,"");
	b_exchangeroutine(vlk_524_dusty,"start");
	dusty = Hlp_GetNpc(vlk_524_dusty);
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;
};

func void dia_grd_216_dustyzoll_littlewalk()
{
	var C_NPC dusty;
	AI_Output(other,self,"DIA_Grd_216_Dusty_Zoll_LittleWalk_15_00");	//�� ������ ����� �����������. � ��� ���� �� ��� ��������� �������.
	if(Npc_HasItems(hero,itminugget) >= 100)
	{
		AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_LittleWalk_13_00");	//� ������ �� �����.
		b_giveinvitems(hero,self,itminugget,100);
		dia_grd_216_dustyzoll.permanent = 0;
		b_logentry(CH1_RECRUITDUSTY,"�������� � ����� ����� ������ ���, ��� �� ��� �� �����. �� ��������� �����, �������. ��� ����� ���� ����!");
		b_givexp(XP_BRIBEDDUSTYGUARD);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Grd_216_Dusty_Zoll_LittleWalk_13_02");	//��, ��� ��������� ���� ������? ��� �� ������, �����!
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,zs_attack,1,"");
		b_exchangeroutine(vlk_524_dusty,"start");
		dusty = Hlp_GetNpc(vlk_524_dusty);
		dusty.aivar[AIV_PARTYMEMBER] = FALSE;
		dusty.flags = 0;
	};
};


instance GRD_216_TORWACHE_SEETHORUS(C_INFO)
{
	npc = grd_216_torwache;
	condition = grd_216_torwache_seethorus_condition;
	information = grd_216_torwache_seethorus_info;
	important = 1;
	permanent = 0;
};


func int grd_216_torwache_seethorus_condition()
{
	if(!Npc_KnowsInfo(hero,grd_214_torwache_seethorus) && ((CORKALOM_BRINGMCQBALLS == LOG_SUCCESS) || (Npc_HasItems(hero,itat_crawlerqueen) >= 3)) && !Npc_KnowsInfo(hero,grd_200_thorus_gardist) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return TRUE;
	};
};

func void grd_216_torwache_seethorus_info()
{
	AI_Output(self,other,"Grd_216_Torwache_SEETHORUS_Info_13_01");	//���, ��� �� ���������. ����� ����� ���������� � �����!
	AI_Output(other,self,"Grd_216_Torwache_SEETHORUS_Info_15_02");	//� ��� ��� �����?
	AI_Output(self,other,"Grd_216_Torwache_SEETHORUS_Info_13_03");	//�� ��� ���� ��� ���������.
};

