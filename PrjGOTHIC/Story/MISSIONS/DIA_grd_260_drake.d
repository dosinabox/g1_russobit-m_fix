
instance GRD_260_DRAKE_EXIT(C_INFO)
{
	npc = grd_260_drake;
	nr = 999;
	condition = grd_260_drake_exit_condition;
	information = grd_260_drake_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int grd_260_drake_exit_condition()
{
	return 1;
};

func void grd_260_drake_exit_info()
{
	AI_Output(other,self,"Info_Exit_Info_15_01");	//�� �������!
	AI_StopProcessInfos(self);
};


instance GRD_260_DRAKE_GEFAHR(C_INFO)
{
	npc = grd_260_drake;
	condition = grd_260_drake_gefahr_condition;
	information = grd_260_drake_gefahr_info;
	important = 0;
	permanent = 0;
	description = "�������� ���, ���� ����� ������� ������������.";
};


func int grd_260_drake_gefahr_condition()
{
	return Npc_KnowsInfo(hero,grd_260_drake_mine);
};

func void grd_260_drake_gefahr_info()
{
	AI_Output(other,self,"Grd_260_Drake_Gefahr_Info_15_01");	//�������� ���, ���� ����� ������� ������������.
	AI_Output(self,other,"Grd_260_Drake_Gefahr_Info_11_02");	//������� ��������� ������������ �������. 
	AI_Output(self,other,"Grd_260_Drake_Gefahr_Info_11_03");	//��-�� ��� �� ��������� ���� �������� ��������� ������. ��� ���� ����� ���������� ���������.
	AI_Output(other,self,"Grd_260_Drake_Gefahr_Info_15_04");	//�������� ��� � ��������.
	AI_Output(self,other,"Grd_260_Drake_Gefahr_Info_11_05");	//� ���� � ����� ������ ���������...
	AI_Output(self,other,"Grd_260_Drake_Gefahr_Info_11_06");	//���� �� ��������� ��� ����, � �������� ���� � ���.
};


instance GRD_260_DRAKE_CRAWLER_OKAY(C_INFO)
{
	npc = grd_260_drake;
	condition = grd_260_drake_crawler_okay_condition;
	information = grd_260_drake_crawler_okay_info;
	important = 0;
	permanent = 0;
	description = "(���������� ����)";
};


func int grd_260_drake_crawler_okay_condition()
{
	if(Npc_KnowsInfo(hero,grd_260_drake_gefahr))
	{
		return 1;
	};
};

func void grd_260_drake_crawler_okay_info()
{
	if(Npc_HasItems(hero,itfobeer))
	{
		AI_Output(hero,self,"Grd_260_Drake_Crawler_Okay_15_01");	//���, ����� ��� �� ��� ��������!
		b_giveinvitems(hero,self,itfobeer,1);
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,itfobeer);
		AI_Output(self,hero,"Grd_260_Drake_Crawler_Okay_11_02");	//�������. ������� ����� �������� ������ � ������ ����������� ������.
		AI_Output(self,hero,"Grd_260_Drake_Crawler_Okay_11_03");	//� �������� ������ ��� ��� �� �� ���� �� ��������. ���� �� ���������� �� �������, ���� �� ���� ��� ����� ������!
		AI_Output(self,hero,"Grd_260_Drake_Crawler_Okay_11_04");	//��� ����� ������ � �����. �����, ����� ����, ���� ������� ��������.
	}
	else
	{
		AI_Output(self,other,"Grd_260_Drake_Crawler_Okay_11_06");	//�� ������, ��? �������, ����� � ���� ����� ����.
		grd_260_drake_crawler_okay.permanent = 1;
	};
};


instance GRD_260_DRAKE_MINE(C_INFO)
{
	npc = grd_260_drake;
	condition = grd_260_drake_mine_condition;
	information = grd_260_drake_mine_info;
	important = 0;
	permanent = 0;
	description = "�� ������ ���������� ��� ���-������ � �����?";
};


func int grd_260_drake_mine_condition()
{
	return 1;
};

func void grd_260_drake_mine_info()
{
	AI_Output(other,self,"Grd_260_Drake_Mine_Info_15_01");	//�� ������ ���������� ��� ���-������ � �����?
	AI_Output(self,other,"Grd_260_Drake_Mine_Info_11_02");	//�� ��������� � ������� ������. ���� ����� ���������� � ������� ������� ���������.
	AI_Output(self,other,"Grd_260_Drake_Mine_Info_11_03");	//�������� �������� �����. �� ���� ���������, ����� ����� ����� ��������.
	AI_Output(self,other,"Grd_260_Drake_Mine_Info_11_04");	//�� ������ ��������� ����� ���������. �� ���� ������ ��������� ����� ���������� ����.
};


instance GRD_260_DRAKE_MINE_MEHR(C_INFO)
{
	npc = grd_260_drake;
	condition = grd_260_drake_mine_mehr_condition;
	information = grd_260_drake_mine_mehr_info;
	important = 0;
	permanent = 0;
	description = "�������� �� ���� ���-������ ���.";
};


func int grd_260_drake_mine_mehr_condition()
{
	if(Npc_KnowsInfo(hero,grd_260_drake_mine))
	{
		return 1;
	};
};

func void grd_260_drake_mine_mehr_info()
{
	AI_Output(other,self,"Grd_260_Drake_Mine_Mehr_Info_15_01");	//�������� �� ���� ���-������ ���.
	AI_Output(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_02");	//� �����, ������ ������ ���������� ���� ������. ������ ���. �� ��� ����������.
	AI_Output(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_03");	//��� �������� � ����. �� ��������� ����� ������ �����. 
};


instance GRD_260_DRAKE_IAN(C_INFO)
{
	npc = grd_260_drake;
	condition = grd_260_drake_ian_condition;
	information = grd_260_drake_ian_info;
	important = 0;
	permanent = 0;
	description = "��� ��� ����� ���?";
};


func int grd_260_drake_ian_condition()
{
	if(!Npc_KnowsInfo(hero,stt_301_ian_hi) && Npc_KnowsInfo(hero,grd_260_drake_mine_mehr))
	{
		return TRUE;
	};
};

func void grd_260_drake_ian_info()
{
	AI_Output(other,self,"Grd_260_Drake_Ian_Info_15_01");	//��� ��� ����� ���?
	AI_Output(self,other,"Grd_260_Drake_Ian_Info_11_02");	//�� ��������� � ������ �������� ������, ����� ������.
	AI_Output(self,other,"Grd_260_Drake_Ian_Info_11_03");	//��, �� ������ ������? ������ ����� � ���!
	AI_Output(self,other,"Grd_260_Drake_Ian_Info_11_04");	//� ����� ��������� ������ ���� �������, � ��� ��. �� � ��� �������.
	AI_Output(self,other,"Grd_260_Drake_Ian_Info_11_05");	//���� �� ���������� � ���, ������, ��� �� ���������� �� ����� � �����, �����?
};


instance GRD_260_DRAKE_GARDEAUFNAHME(C_INFO)
{
	npc = grd_260_drake;
	condition = grd_260_drake_gardeaufnahme_condition;
	information = grd_260_drake_gardeaufnahme_info;
	important = 1;
	permanent = 0;
};


func int grd_260_drake_gardeaufnahme_condition()
{
	if((Npc_HasItems(hero,itat_crawlerqueen) >= 1) && (Npc_GetTrueGuild(hero) == GIL_STT) && !Npc_KnowsInfo(hero,grd_264_gardist_gardeaufnahme))
	{
		return TRUE;
	};
};

func void grd_260_drake_gardeaufnahme_info()
{
	AI_Output(self,other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_01");	//��! �� ������� ����������� � ���������! �����, ������ �� ������������ ��������� ���������.
	AI_Output(self,other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_02");	//��� � ������ ������ � �������� � �������!
	Log_CreateTopic(GE_BECOMEGUARD,LOG_NOTE);
	b_logentry(GE_BECOMEGUARD,"����� � ������� ����, � ������ ���� ���������� � �������. ����� ����, �� ������ ���� � ���������.");
};

