
instance DIA_GRD_264_EXIT(C_INFO)
{
	npc = grd_264_gardist;
	nr = 999;
	condition = dia_grd_264_exit_condition;
	information = dia_grd_264_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_grd_264_exit_condition()
{
	return TRUE;
};

func void dia_grd_264_exit_info()
{
	AI_StopProcessInfos(self);
};


instance GRD_264_GARDIST_GARDEAUFNAHME(C_INFO)
{
	npc = grd_264_gardist;
	condition = grd_264_gardist_gardeaufnahme_condition;
	information = grd_264_gardist_gardeaufnahme_info;
	important = 1;
	permanent = 0;
};


func int grd_264_gardist_gardeaufnahme_condition()
{
	if((Npc_HasItems(hero,itat_crawlerqueen) >= 1) && (Npc_GetTrueGuild(hero) == GIL_STT) && !Npc_KnowsInfo(hero,grd_260_drake_gardeaufnahme))
	{
		return TRUE;
	};
};

func void grd_264_gardist_gardeaufnahme_info()
{
	AI_Output(self,other,"Grd_264_Gardist_GARDEAUFNAHME_Info_07_01");	//��, �������� ������. �� ����������� � ���������! �� ������� ���� ����� �� ����������! �� ��� ��������.
	AI_Output(self,other,"Grd_264_Gardist_GARDEAUFNAHME_Info_07_02");	//��� � ������ ������ � �������� � �������.
	Log_CreateTopic(GE_BECOMEGUARD,LOG_NOTE);
	b_logentry(GE_BECOMEGUARD,"����� � ������ ���� ��������, � ������ ���������� � �������. ����� ����, �� �������� ���� � ���� ����������.");
};

