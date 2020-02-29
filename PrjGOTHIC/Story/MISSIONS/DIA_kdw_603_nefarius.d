
instance INFO_NEFARIUS_EXIT(C_INFO)
{
	npc = kdw_603_nefarius;
	nr = 999;
	condition = info_nefarius_exit_condition;
	information = info_nefarius_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_nefarius_exit_condition()
{
	return 1;
};

func void info_nefarius_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_NEFARIUS_HALLO(C_INFO)
{
	npc = kdw_603_nefarius;
	nr = 1;
	condition = info_nefarius_hallo_condition;
	information = info_nefarius_hallo_info;
	permanent = 0;
	description = "��� ��?";
};


func int info_nefarius_hallo_condition()
{
	return 1;
};

func void info_nefarius_hallo_info()
{
	AI_Output(other,self,"Info_Nefarius_Hallo_15_00");	//��� ��?
	AI_Output(self,other,"Info_Nefarius_Hallo_04_01");	//� ��������, ��� ����� ����.
};


instance INFO_NEFARIUS_WOSATURAS(C_INFO)
{
	npc = kdw_603_nefarius;
	nr = 2;
	condition = info_nefarius_wosaturas_condition;
	information = info_nefarius_wosaturas_info;
	permanent = 0;
	description = "��� ����� ��������?";
};


func int info_nefarius_wosaturas_condition()
{
	return 1;
};

func void info_nefarius_wosaturas_info()
{
	AI_Output(other,self,"Info_Nefarius_WoSaturas_15_00");	//��� ����� ��������?
	AI_Output(self,other,"Info_Nefarius_WoSaturas_04_01");	//������ �� ������� ������� ������. ��� �� ������� ��� �����.
};


instance INFO_NEFARIUS_WANNAMAGE(C_INFO)
{
	npc = kdw_603_nefarius;
	nr = 1;
	condition = info_nefarius_wannamage_condition;
	information = info_nefarius_wannamage_info;
	permanent = 0;
	description = "� ���� ����� ����� ����� ����!";
};


func int info_nefarius_wannamage_condition()
{
	if(Npc_KnowsInfo(hero,info_nefarius_hallo))
	{
		return 1;
	};
};

func void info_nefarius_wannamage_info()
{
	AI_Output(other,self,"Info_Nefarius_WannaMage_15_00");	//� ���� ����� ����� ����� ����!
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_01");	//�� �����, ��� �� �������� ��� ������!
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_02");	//������ ��� ����� � ���� ���� ������ ��������, �� ������ ���������, ��� �� ����� �������.
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_03");	//�� ������ ��������� ��� �����-�� �����.
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_04");	//���� ���� ��������� ��������, �� ����� � ����� ��������� � ���������� ����� ����� �� ���. ��� � ����� ���� ������.
	AI_Output(self,other,"Info_Nefarius_WannaMage_04_05");	//�, ����� ����, ������� � ���� �������� ���� �������� ����.
};


instance INFO_NEFARIUS_NOWREADY(C_INFO)
{
	npc = kdw_603_nefarius;
	nr = 1;
	condition = info_nefarius_nowready_condition;
	information = info_nefarius_nowready_info;
	permanent = 1;
	description = "� ���� ����� ����� �� ����� ����� ����?";
};


func int info_nefarius_nowready_condition()
{
	if(!FMTAKEN && Npc_KnowsInfo(hero,info_nefarius_wannamage) && (Npc_GetTrueGuild(hero) != GIL_KDW))
	{
		return 1;
	};
};

func void info_nefarius_nowready_info()
{
	AI_Output(other,self,"Info_Nefarius_NowReady_15_00");	//� ���� ����� ����� �� ����� ����� ����?
	if(Npc_GetTrueGuild(hero) != GIL_SLD)
	{
		AI_Output(self,other,"Info_Nefarius_NowReady_04_01");	//������� ����� ����� �� ����� ���������, � ��� ���������...
	}
	else
	{
		AI_Output(self,other,"Info_Nefarius_NowReady_04_02");	//����, ���� ������� � ��������. ������, ����� ������...
		AI_Output(self,other,"Info_Nefarius_NowReady_04_03");	//��� ��������� ������� �� ��������...
	};
};


instance INFO_NEFARIUS_OCNEWS(C_INFO)
{
	npc = kdw_603_nefarius;
	nr = 1;
	condition = info_nefarius_ocnews_condition;
	information = info_nefarius_ocnews_info;
	permanent = 0;
	important = 1;
};


func int info_nefarius_ocnews_condition()
{
	if(FMTAKEN && !FINDXARDAS)
	{
		return TRUE;
	};
};

func void info_nefarius_ocnews_info()
{
	AI_Output(self,other,"Info_Nefarius_OCNews_04_00");	//�� ������ ���������� ���-������ � ����� ������� �� ������� ������?
	AI_Output(other,self,"Info_Nefarius_OCNews_15_01");	//����� ��������� ���� ����� ����!
	AI_Output(self,other,"Info_Nefarius_OCNews_04_02");	//���! ��� �� ������?! � �� ������������ ��������, ��� ��� ������ ��������! �� ������ ���������� �� ���� ��������!
	if(Npc_GetTrueGuild(hero) == GIL_SLD)
	{
		AI_Output(self,other,"Info_Nefarius_OCNews_04_03");	//������!
		AI_Output(self,other,"Info_Nefarius_OCNews_04_04");	//�� ��������� ���� ������� ���������, ����� ������ ���.
		AI_Output(self,other,"Info_Nefarius_OCNews_04_05");	//�����, ������ �� ������� ������ ������� ����� ����.
		AI_Output(self,other,"Info_Nefarius_OCNews_04_06");	//�� ������ ��� � �������� � ���������! �������!
	};
	AI_StopProcessInfos(self);
};

