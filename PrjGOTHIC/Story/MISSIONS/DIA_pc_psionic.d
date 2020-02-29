
instance PC_PSIONIC_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = pc_psionic_exit_condition;
	information = pc_psionic_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int pc_psionic_exit_condition()
{
	return 1;
};

func void pc_psionic_exit_info()
{
	if(self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output(self,hero,"Info_Lester_EXIT_05_01");	//������!
	}
	else
	{
		AI_Output(self,hero,"Info_Lester_EXIT_05_02");	//�� ������ ���� ������!
	};
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_SAKRILEG(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_lester_sakrileg_condition;
	information = dia_lester_sakrileg_info;
	permanent = 0;
	important = 1;
};


func int dia_lester_sakrileg_condition()
{
	if(BAALNAMIB_SAKRILEG == TRUE)
	{
		return 1;
	};
};

func void dia_lester_sakrileg_info()
{
	AI_Output(self,other,"DIA_Lester_Sakrileg_05_00");	//�� ������� ���������� � ����! ����� ������ ������! ��� ������������. ����� ������� �������, �� ��� ��������� � ����.
};


instance DIA_LESTER_HALLO(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_lester_hallo_condition;
	information = dia_lester_hallo_info;
	permanent = 0;
	description = "��� ��?";
};


func int dia_lester_hallo_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_lester_hallo_info()
{
	AI_Output(other,self,"DIA_Lester_Hallo_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Lester_Hallo_05_01");	//� ������. � �������� � ���, ��� �������� � ���� ������.
	if(BAALNAMIB_SAKRILEG == FALSE)
	{
		AI_Output(self,other,"DIA_Lester_Hallo_05_02");	//�� �� ���� ���������� � ����� ������. ��� ������� ����. �� ���� �������� �� ����� �������� � ����.
	};
};


instance DIA_LESTER_WANNATALKTOMASTER(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_wannatalktomaster_condition;
	information = dia_lester_wannatalktomaster_info;
	permanent = 0;
	description = "�� ��� ����� � ��� ����������.";
};


func int dia_lester_wannatalktomaster_condition()
{
	if((Npc_KnowsInfo(hero,dia_lester_hallo) || Npc_KnowsInfo(hero,dia_lester_sakrileg)) && (Npc_GetTrueGuild(hero) == GIL_NONE) && !Npc_KnowsInfo(hero,dia_lester_showhallo))
	{
		return 1;
	};
};

func void dia_lester_wannatalktomaster_info()
{
	AI_Output(other,self,"DIA_Lester_WannaTalkToMaster_15_00");	//�� ��� ����� � ��� ����������.
	AI_Output(self,other,"DIA_Lester_WannaTalkToMaster_05_01");	//�� �����! � ������, ��� ��� ����� ������ ���� ������ ���� ��������.
};


instance DIA_LESTER_CAMPINFO(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_campinfo_condition;
	information = dia_lester_campinfo_info;
	permanent = 1;
	description = "�������� ��� ���-������ � ������.";
};


func int dia_lester_campinfo_condition()
{
	if(Npc_KnowsInfo(hero,dia_lester_hallo) && (KAPITEL < 3))
	{
		return 1;
	};
};

func void dia_lester_campinfo_info()
{
	AI_Output(other,self,"DIA_Lester_CampInfo_15_00");	//�������� ��� ���-������ � ������.
	AI_Output(self,other,"DIA_Lester_CampInfo_05_01");	//��� �� ������ �����?
	Info_ClearChoices(dia_lester_campinfo);
	Info_AddChoice(dia_lester_campinfo,DIALOG_BACK,dia_lester_campinfo_back);
	Info_AddChoice(dia_lester_campinfo,"�������� ��� � ��������.",dia_lester_campinfo_gil);
	Info_AddChoice(dia_lester_campinfo,"��� ����� ������?",dia_lester_campinfo_sleeper);
	Info_AddChoice(dia_lester_campinfo,"��� �� ������ � ���������?",dia_lester_campinfo_herb);
};

func void dia_lester_campinfo_back()
{
	Info_ClearChoices(dia_lester_campinfo);
};

func void dia_lester_campinfo_gil()
{
	AI_Output(other,self,"DIA_Lester_CampInfo_GIL_15_00");	//�������� ��� � ��������.
	AI_Output(self,other,"DIA_Lester_CampInfo_GIL_05_01");	//���� ������ � ��������� �������. ��� ������������ ��� ������ ������ � �� ���� ������. ������ ���� ������, ������� ���������� ���� �������� ���� � ���.
	AI_Output(self,other,"DIA_Lester_CampInfo_GIL_05_02");	//�� ���� �����������. ����� �� �������� � ��� �� ����. ��� � ���������. �� �������� ������� ������� � ��������� ��� ������ � ������.
	AI_Output(self,other,"DIA_Lester_CampInfo_GIL_05_03");	//��������� �� ����������� ����� ����� ����, �� ��� ����� ��� ������ ������� ���������.
};

func void dia_lester_campinfo_sleeper()
{
	AI_Output(other,self,"DIA_Lester_CampInfo_SLEEPER_15_00");	//��� ����� ������?
	AI_Output(self,other,"DIA_Lester_CampInfo_SLEEPER_05_01");	//������ - ��� ���. �� �������� ��� �������. �� �� ������ ������� ����� �����. ���� ���� �������� �� ���� ���� ���.
	AI_Output(self,other,"DIA_Lester_CampInfo_SLEEPER_05_02");	//�� ������� ���, ������ ��� �����, ��� �� ������ ���������� ���.
	AI_Output(other,self,"DIA_Lester_CampInfo_SLEEPER_15_03");	//� �� � ��� ������?
	AI_Output(self,other,"DIA_Lester_CampInfo_SLEEPER_05_04");	//��, � ������ ����� ��� ��� ����. �� ������, ��� ��� ����� - ������� ��� ���� � ���� ������?
	AI_Output(self,other,"DIA_Lester_CampInfo_SLEEPER_05_05");	//�� ���� ����������� �� ������, ���� � ����� ��������, ���� �� ���� �� ����� �����.
};

func void dia_lester_campinfo_herb()
{
	AI_Output(other,self,"DIA_Lester_CampInfo_HERB_15_00");	//��� �� ������ � ���������?
	AI_Output(self,other,"DIA_Lester_CampInfo_HERB_05_01");	//��, �������� �� �������� �� �������, ��� ���� ��������. ����� ����� �� ������������ ���������� ���������, ����� ��� ����� ���� ������. ��� ������ ��������� ����������.
	AI_Output(self,other,"DIA_Lester_CampInfo_HERB_05_02");	//�������� �������� ������������ � �����������, ���� ����������� ��������������� �� ������� � ���������� ��������.
	AI_Output(self,other,"DIA_Lester_CampInfo_HERB_05_03");	//�� ������ ��� �� ������ �� ������ ������� � ���������� ��� ����������� ����� ����� � ��������.
	AI_Output(self,other,"DIA_Lester_CampInfo_HERB_05_04");	//�������, ��������� �������������� � ��� ������ ��-�� ����. ��, ��� ���� �� ����������� ��������� ��������� ������ � ������.
};


instance DIA_LESTER_WANNAJOIN(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_wannajoin_condition;
	information = dia_lester_wannajoin_info;
	permanent = 0;
	description = "� ���� �������������� � ��������!";
};


func int dia_lester_wannajoin_condition()
{
	if(Npc_KnowsInfo(hero,dia_lester_hallo) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void dia_lester_wannajoin_info()
{
	AI_Output(other,self,"DIA_Lester_WannaJoin_15_00");	//� ���� �������������� � ��������!
	AI_Output(self,other,"DIA_Lester_WannaJoin_05_01");	//������ ��� ����� ����� ������, ����� �� �� �������� � ���� ��������.
	AI_Output(self,other,"DIA_Lester_WannaJoin_05_02");	//�� �� ���������� � �� ������ ������ ����. �� ����� ������ ����� ������.
	AI_Output(self,other,"DIA_Lester_WannaJoin_05_03");	//������� �� ������ �������� ���� �����������, ����� ����� ���� �� ���� �������� ���� � ��� ������.
};


instance DIA_LESTER_HOWPROOFWORTHY(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_howproofworthy_condition;
	information = dia_lester_howproofworthy_info;
	permanent = 0;
	description = "��� �� ��� �������? ����� �� ��� �� ����� �� ���� �������������?";
};


func int dia_lester_howproofworthy_condition()
{
	if(Npc_KnowsInfo(hero,dia_lester_wannajoin) && (Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		return 1;
	};
};

func void dia_lester_howproofworthy_info()
{
	AI_Output(other,self,"DIA_Lester_HowProofWorthy_15_00");	//��� �� ��� �������, ���� ����� �� ��� �� ����� �� ���� �������������?
	AI_Output(self,other,"DIA_Lester_HowProofWorthy_05_01");	//���� �����, �� �� ������ ����� ��������, �� �� ����� ������ ����� ��������� ����.
	AI_Output(self,other,"DIA_Lester_HowProofWorthy_05_02");	//����� ��� �����, ��� �� ������� ���� ��������, ��� ������ ���� �� ����.
	AI_Output(self,other,"DIA_Lester_HowProofWorthy_05_03");	//� �����, ���� ����� ����� ������������� ����������� �������� ���� ����������� ������ ������.
	Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINPSI,LOG_RUNNING);
	b_logentry(CH1_JOINPSI,"���� � ���� �������������� � ������� �� ��������� ������, � ������ ���������� ����������� �� ����. ��� �� ������������� � ���������. ��, ��� ������ ������, ��� ����� ��������� �� ����, � ����� � ���� ���������� �������� �� ���, � ������ ����� ���� ��������. ������, � ��� �� �������, ��� ��� ������! ����� � ������� �������� ������.");
};


var int lester_show;

instance DIA_LESTER_WEITWEG(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_weitweg_condition;
	information = dia_lester_weitweg_info;
	permanent = 0;
	description = "��� ��� ���������� � ����� ��������?";
};


func int dia_lester_weitweg_condition()
{
	var C_NPC namib;
	namib = Hlp_GetNpc(gur_1204_baalnamib);
	if((Npc_GetDistToNpc(other,namib) > 1000) && (BAALNAMIB_ANSPRECHBAR == FALSE) && (Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		return 1;
	};
};

func void dia_lester_weitweg_info()
{
	AI_Output(other,self,"DIA_Lester_WeitWeg_15_00");	//��� ��� ���������� � ����� ��������?
	AI_Output(self,other,"DIA_Lester_WeitWeg_05_01");	//�� ������ �����, ��� �� ����� �� ���� ��������.
	AI_Output(other,self,"DIA_Lester_WeitWeg_15_02");	//� ��� ��?
	AI_Output(self,other,"DIA_Lester_WeitWeg_05_03");	//���� ����������. ����� �� � ��������� ��� �������� � ����, �������� �� ���, � �� ������� ���������.
	AI_Output(self,other,"DIA_Lester_WeitWeg_05_04");	//������ � ����� ������ ����� ����� �����, ���� ���� ���������� ��� ��� �� ������� �������� ������ �����.
	AI_Output(self,other,"DIA_Lester_WeitWeg_05_05");	//�� ������� ���, ��� ����������� �� ������ ���� � ������ ������ ������� �� ������� �������.
	AI_Output(self,other,"DIA_Lester_WeitWeg_05_06");	//� ������ ����, ��� ��������� ���� ������ � ������ �������, � �� ��������, ��� ���� ���� �������, � ������� ������ ������� ���� � ����.
	AI_Output(self,other,"DIA_Lester_WeitWeg_05_07");	//�� �� ��������� �����������. �� ������� � ���� ����������?
	AI_Output(other,self,"DIA_Lester_WeitWeg_15_08");	//�����.
	Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINPSI,LOG_RUNNING);
	b_logentry(CH1_JOINPSI,"����� ������� ����� ������, � ������ ������� �������, ��� �������� ���� � ������� � ����������� �� ������ �����, ��� ����� �� ��� ������.");
	LESTER_SHOW = TRUE;
};


instance DIA_LESTER_SHOWHALLO(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_lester_showhallo_condition;
	information = dia_lester_showhallo_info;
	permanent = 0;
	important = 1;
};


func int dia_lester_showhallo_condition()
{
	var C_NPC namib;
	namib = Hlp_GetNpc(gur_1204_baalnamib);
	if((Npc_GetDistToNpc(other,namib) < 500) && (BAALNAMIB_ANSPRECHBAR == FALSE) && (LESTER_SHOW == TRUE) && (Npc_GetTrueGuild(hero) == GIL_NONE))
	{
		return 1;
	};
};

func void dia_lester_showhallo_info()
{
	AI_Output(self,other,"DIA_Lester_ShowHallo_05_00");	//��! ��� � ��� ����� �������. ��� � ���� ����?
};


instance DIA_LESTER_SHOW(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_lester_show_condition;
	information = dia_lester_show_info;
	permanent = 0;
	description = "� ������� �� ������ �����.";
};


func int dia_lester_show_condition()
{
	var C_NPC namib;
	namib = Hlp_GetNpc(gur_1204_baalnamib);
	if((Npc_GetDistToNpc(other,namib) < 500) && (BAALNAMIB_ANSPRECHBAR == FALSE) && (LESTER_SHOW == TRUE))
	{
		return 1;
	};
};

func void dia_lester_show_info()
{
	AI_Output(other,self,"DIA_Lester_Show_15_00");	//� ������� �� ������ �����.
	AI_Output(self,other,"DIA_Lester_Show_05_01");	//������? � ������ �� ��� �����?
	AI_Output(other,self,"DIA_Lester_Show_15_02");	//��� ���� �������. ������ ������� �� ����.
	AI_Output(self,other,"DIA_Lester_Show_05_03");	//� ��� �� ������?
	AI_Output(other,self,"DIA_Lester_Show_15_04");	//�� ������: ��� � ������ �� ������� � ����� ����� �� �������.
	AI_Output(self,other,"DIA_Lester_Show_05_05");	//���� ���������� �������, ����������, �������� ����� ����������� ����� �����!
	BAALNAMIB_ANSPRECHBAR = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_GUIDEOFFER(C_INFO)
{
	npc = pc_psionic;
	nr = 5;
	condition = dia_lester_guideoffer_condition;
	information = dia_lester_guideoffer_info;
	permanent = 0;
	description = "��� ��� ��������������� � ���� ������?";
};


func int dia_lester_guideoffer_condition()
{
	if(Npc_KnowsInfo(hero,dia_lester_hallo) && (KAPITEL < 3))
	{
		return 1;
	};
};

func void dia_lester_guideoffer_info()
{
	AI_Output(other,self,"DIA_Lester_GuideOffer_15_00");	//��� ��� ��������������� � ���� ������?
	AI_Output(self,other,"DIA_Lester_GuideOffer_05_01");	//� ���� ���� �������� ��� ������.
};


instance PC_PSIONIC_SOON(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_soon_condition;
	information = pc_psionic_soon_info;
	important = 0;
	permanent = 1;
	description = "�� ��� ������?";
};


func int pc_psionic_soon_condition()
{
	if(Npc_KnowsInfo(hero,dia_lester_guideoffer) && (KAPITEL < 3) && (LESTERGUIDE >= 1))
	{
		return TRUE;
	};
};

func void pc_psionic_soon_info()
{
	AI_Output(other,self,"PC_Psionic_SOON_Info_15_01");	//�� ��� ������?
	AI_Output(self,other,"PC_Psionic_SOON_Info_05_02");	//���� �� �� ������ �������� ����� ��������, �� � ���� ������ ���������.
	AI_StopProcessInfos(self);
};


instance PC_PSIONIC_CHANGE(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_change_condition;
	information = pc_psionic_change_info;
	important = 0;
	permanent = 1;
	description = "� ���������.";
};


func int pc_psionic_change_condition()
{
	if(Npc_KnowsInfo(hero,dia_lester_guideoffer) && (KAPITEL < 3) && (LESTERGUIDE >= 1))
	{
		return TRUE;
	};
};

func void pc_psionic_change_info()
{
	AI_Output(other,self,"PC_Psionic_CHANGE_Info_15_01");	//� ���������.
	AI_Output(self,other,"PC_Psionic_CHANGE_Info_05_02");	//�� ������, ��� ���� �����.
	AI_StopProcessInfos(self);
	LESTERGUIDE = 0;
	Npc_ExchangeRoutine(self,"START");
};


instance PC_PSIONIC_GUIDEFIRST(C_INFO)
{
	npc = pc_psionic;
	nr = 5;
	condition = pc_psionic_guidefirst_condition;
	information = pc_psionic_guidefirst_info;
	important = 0;
	permanent = 1;
	description = "��� ������...";
};


func int pc_psionic_guidefirst_condition()
{
	if(Npc_KnowsInfo(hero,dia_lester_guideoffer) && (KAPITEL < 3) && (LESTERGUIDE == 0))
	{
		return TRUE;
	};
};

func void pc_psionic_guidefirst_info()
{
	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_Info_15_01");	//��� ������...
	Info_ClearChoices(pc_psionic_guidefirst);
	Info_AddChoice(pc_psionic_guidefirst,DIALOG_BACK,pc_psionic_guidefirst_back);
	Info_AddChoice(pc_psionic_guidefirst,"...����� � ������� �������?",pc_psionic_guidefirst_maingate);
	Info_AddChoice(pc_psionic_guidefirst,"...� �������?",pc_psionic_guidefirst_smith);
	Info_AddChoice(pc_psionic_guidefirst,"...� �����?",pc_psionic_guidefirst_tempel);
	Info_AddChoice(pc_psionic_guidefirst,"...� �����������?",pc_psionic_guidefirst_train);
	Info_AddChoice(pc_psionic_guidefirst,"...� �����������?",pc_psionic_guidefirst_herb);
};

func void pc_psionic_guidefirst_maingate()
{
	Npc_ClearAIQueue(self);
	Info_ClearChoices(pc_psionic_guidefirst);
	LESTERGUIDE = 0;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void pc_psionic_guidefirst_smith()
{
	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_SMITH_Info_15_01");	//...� �������?
	AI_Output(self,other,"PC_Psionic_GUIDEFIRST_SMITH_Info_05_02");	//������ �� ����!
	LESTERGUIDE = 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDETOSMITH");
};

func void pc_psionic_guidefirst_tempel()
{
	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_15_01");	//...� �����?
	AI_Output(self,other,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_05_02");	//������ �� ����!
	LESTERGUIDE = 2;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDETOTEMPEL");
};

func void pc_psionic_guidefirst_train()
{
	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_TRAIN_Info_15_01");	//...� �����������?
	AI_Output(self,other,"PC_Psionic_GUIDEFIRST_TARIN_Info_05_02");	//������ �� ����!
	LESTERGUIDE = 3;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDETOTRAIN");
};

func void pc_psionic_guidefirst_herb()
{
	AI_Output(other,self,"PC_Psionic_GUIDEFIRST_HERB_Info_15_01");	//...� �����������?
	AI_Output(self,other,"PC_Psionic_GUIDEFIRST_HERB_Info_05_02");	//������ �� ����!
	LESTERGUIDE = 4;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDETOHERB");
};

func void pc_psionic_guidefirst_back()
{
	Info_ClearChoices(pc_psionic_guidefirst);
};


instance PC_PSIONIC_TRAIN(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_train_condition;
	information = pc_psionic_train_info;
	important = 1;
	permanent = 1;
};


func int pc_psionic_train_condition()
{
	if((Npc_GetDistToWP(self,"PSI_PATH_9_4") < 500) && (LESTERGUIDE == 3))
	{
		return TRUE;
	};
};

func void pc_psionic_train_info()
{
	AI_Output(self,other,"PC_Psionic_TRAIN_Info_05_01");	//����� ����� �� ������� ����� ������. �� ������� �����������.
	AI_PointAt(self,"PSI_PATH_9_14");
	AI_StopPointAt(self);
	AI_Output(self,other,"PC_Psionic_TRAIN_Info_05_02");	//��� �������� ����� �� ������������� �������� �������. � ������� ���� �����. ���� �� �����������, �� ������� ����� ���� � ����� � ������.
	LESTERGUIDE = 0;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay(self);
	ta_stay(0,0,0,55,"PSI_PATH_9_4");
	TA_EndOverlay(self);
};


instance PC_PSIONIC_TEMPEL(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_tempel_condition;
	information = pc_psionic_tempel_info;
	important = 1;
	permanent = 0;
};


func int pc_psionic_tempel_condition()
{
	if((Npc_GetDistToWP(self,"PSI_TEMPLE_NOVIZE_PR") < 600) && (LESTERGUIDE == 2))
	{
		return TRUE;
	};
};

func void pc_psionic_tempel_info()
{
	AI_Output(self,other,"PC_Psionic_TEMPEL_Info_05_01");	//��� ��� ����. �� ������ ����������� �����, �� ����� �� ������������, ����� � ������� � ����� ������.
	LESTERGUIDE = 0;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay(self);
	ta_stay(0,0,1,0,"PSI_TEMPLE_NOVIZE_PR");
	TA_EndOverlay(self);
};


instance PC_PSIONIC_SMITH(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_smith_condition;
	information = pc_psionic_smith_info;
	important = 1;
	permanent = 0;
};


func int pc_psionic_smith_condition()
{
	if((Npc_GetDistToWP(self,"PSI_SMITH_IN") < 900) && (LESTERGUIDE == 1))
	{
		return 1;
	};
};

func void pc_psionic_smith_info()
{
	AI_Output(self,other,"PC_Psionic_SMITH_Info_05_01");	//��� ���� �������! ���������, � ���� ���� ����� ���. ����� � ������� � ����� ������.
	LESTERGUIDE = 0;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay(self);
	ta_stay(0,0,1,0,"PSI_SMITH_IN");
	TA_EndOverlay(self);
};


instance PC_PSIONIC_HERB(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_herb_condition;
	information = pc_psionic_herb_info;
	important = 1;
	permanent = 0;
};


func int pc_psionic_herb_condition()
{
	if((Npc_GetDistToWP(self,"PSI_WALK_06") < 800) && (LESTERGUIDE == 4))
	{
		return TRUE;
	};
};

func void pc_psionic_herb_info()
{
	AI_Output(self,other,"PC_Psionic_HERB_Info_05_01");	//��� �������� ����� � ����������� ��� ������, ��������. � ����� ����� �������, �������� ����������.
	AI_Output(self,other,"PC_Psionic_HERB_Info_05_02");	//� ���� ����� ���� ����� � ������� ����. � ����� ��� �������� ����.
	LESTERGUIDE = 0;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay(self);
	ta_stay(0,0,1,0,"PSI_32_HUT_EX");
	TA_EndOverlay(self);
};


instance PC_PSIONIC_SEND(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_send_condition;
	information = pc_psionic_send_info;
	important = 1;
	permanent = 0;
};


func int pc_psionic_send_condition()
{
	if((Npc_GetTrueGuild(hero) != GIL_NONE) && (YBERION_BRINGFOCUS != LOG_RUNNING) && (YBERION_BRINGFOCUS != LOG_SUCCESS))
	{
		return 1;
	};
};

func void pc_psionic_send_info()
{
	AI_GotoNpc(self,hero);
	if(Npc_KnowsInfo(hero,dia_lester_hallo))
	{
		AI_Output(self,other,"PC_Psionic_SEND_Info_05_00");	//������, ��� �� ������. � ���� ��� ���� �������.
		AI_Output(other,self,"PC_Psionic_SEND_Info_15_01");	//��������.
	};
	AI_Output(self,other,"PC_Psionic_SEND_Info_05_02");	//���� ������ �������� ������� �������� �������.
	AI_Output(other,self,"PC_Psionic_SEND_Info_15_03");	//��? ��� ����� ����� ������?
	AI_Output(self,other,"PC_Psionic_SEND_Info_05_04");	//��� ����� �������� �������. �� �� ����� ���-��, ��� ������� ���������� �� �������� ����.
	//AI_Output(other,self,"PC_Psionic_SEND_Info_15_05");	//��?
	AI_Output(self,other,"PC_Psionic_SEND_Info_05_06");	//��� ����� ����� ���������� ��������, ������� ��� �������� ��������.
	Npc_ExchangeRoutine(pc_psionic,"StartCH2");
	Npc_ExchangeRoutine(gur_1204_baalnamib,"StartCH2");
	b_kapitelwechsel(2);
};


instance PC_PSIONIC_BROTHERHOOD_TODO(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_brotherhood_todo_condition;
	information = pc_psionic_brotherhood_todo_info;
	important = 0;
	permanent = 0;
	description = "� � ��� ���� �������?";
};


func int pc_psionic_brotherhood_todo_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_send))
	{
		return TRUE;
	};
};

func void pc_psionic_brotherhood_todo_info()
{
	var C_NPC yberion;
	AI_Output(other,self,"PC_Psionic_BROTHERHOOD_TODO_15_01");	//� � ��� ���� �������?
	AI_Output(self,other,"PC_Psionic_BROTHERHOOD_TODO_05_02");	//�������� � ���������. �� ��� ������� � ����� �������������� �� ���. � ���� ����� ����������� ��������� ��� �������.
	AI_Output(other,self,"PC_Psionic_BROTHERHOOD_TODO_15_03");	//��� � ���� ��� �����?
	AI_Output(self,other,"PC_Psionic_BROTHERHOOD_TODO_05_04");	//��� � �����. �� ����� �������� ���. ��������, � ���� �������� ������ �� ��������� ���� ����� � �������.
	Log_CreateTopic(CH2_FOCUS,LOG_MISSION);
	Log_SetTopicStatus(CH2_FOCUS,LOG_RUNNING);
	b_logentry(CH2_FOCUS,"��������� ������ ��������� ���, ��� �������� ����� ������. ������� � ����� ����� � ����� �� �����.");
	yberion = Hlp_GetNpc(gur_1200_yberion);
	yberion.aivar[AIV_FINDABLE] = TRUE;
};


instance PC_PSIONIC_FOLLOWME(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_followme_condition;
	information = pc_psionic_followme_info;
	important = 1;
	permanent = 0;
};


func int pc_psionic_followme_condition()
{
	if((Npc_GetDistToWP(hero,"LOCATION_19_01") < 400) && (Npc_GetDistToNpc(hero,self) < 400))
	{
		return TRUE;
	};
};

func void pc_psionic_followme_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_01");	//��, ��� �� ����� �������?
	AI_Output(other,self,"PC_Psionic_FOLLOWME_Info_15_02");	//� �������� ������� ����� ����. �� ����� ���������� ���������, ���������� ���������.
	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_03");	//�� ������ ����� ������, ��? ��������� ���� �� ��������.
	AI_Output(other,self,"PC_Psionic_FOLLOWME_Info_15_04");	//� ��� ������� ������� � ������ ���� �� ������ ������ ����� ��������� ������ � ���������� �������.
	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_05");	//� ������ ����, ������ ����� ����� ��� ������������ �������.
	AI_Output(other,self,"PC_Psionic_FOLLOWME_Info_15_06");	//� ����. �� ����� ���, ����� �� �����?
	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_07");	//� ��� ��� ����� ��� ���, �� ����� �� ��� � ������ ����.
	AI_Output(self,other,"PC_Psionic_FOLLOWME_Info_05_08");	//���� ���� ��������, ������� �� ��� �������� ����� ����. � ������ �������, ������ ���� ����� ������.
};


instance PC_PSIONIC_GOLEM(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_golem_condition;
	information = pc_psionic_golem_info;
	important = 0;
	permanent = 0;
	description = "��� ���� ������� ���������� ����� ��� ����� ����?";
};


func int pc_psionic_golem_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_followme) && !Npc_KnowsInfo(hero,pc_psionic_finish))
	{
		return TRUE;
	};
};

func void pc_psionic_golem_info()
{
	AI_Output(other,self,"PC_Psionic_NORMAL_Info_15_01");	//��� ���� ������� ���������� ����� ��� ����� ����?
	AI_Output(self,other,"PC_Psionic_NORMAL_Info_05_02");	//� ������� �������� � ����. �� ����� ������ ������ �������.
};


instance PC_PSIONIC_STORY(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_story_condition;
	information = pc_psionic_story_info;
	important = 0;
	permanent = 0;
	description = "��� �� �������� �� ������ �����?";
};


func int pc_psionic_story_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_followme))
	{
		return TRUE;
	};
};

func void pc_psionic_story_info()
{
	AI_Output(other,self,"PC_Psionic_STORY_Info_15_01");	//��� �� �������� �� ������ �����?
	AI_Output(self,other,"PC_Psionic_STORY_Info_05_02");	//�����-�� ����� � ���� ����� ��� ��������� ���� ������. ��� ������������ ��� ����� � ��� �����.
	AI_Output(self,other,"PC_Psionic_STORY_Info_05_03");	//��� � ������� ���������, � ���� ��� ��������, �������������� ����� ������������� �� �����. �� �� ��� � �����.
	AI_Output(other,self,"PC_Psionic_STORY_Info_15_04");	//�� ���� �� ��������� �� ��������, �� ����� ���������� ����������.
	AI_Output(self,other,"PC_Psionic_STORY_Info_05_05");	//�� ����. �� ���� ���� ���� ����� ��������� ������, ���� �������� ����� ������� � ����.
};


instance PC_PSIONIC_COMEWITHME(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_comewithme_condition;
	information = pc_psionic_comewithme_info;
	important = 0;
	permanent = 0;
	description = "�� ����� ������ ��������� ���� ����.";
};


func int pc_psionic_comewithme_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_story) && Npc_KnowsInfo(hero,pc_psionic_golem))
	{
		return TRUE;
	};
};

func void pc_psionic_comewithme_info()
{
	AI_Output(other,self,"PC_Psionic_COMEWITHME_Info_15_01");	//�� ����� ������ ��������� ���� ����.
	AI_Output(self,other,"PC_Psionic_COMEWITHME_Info_05_02");	//�������� �����������. ��� ������, � � ����� ������.
	Log_CreateTopic(CH3_FORTRESS,LOG_MISSION);
	Log_SetTopicStatus(CH3_FORTRESS,LOG_RUNNING);
	b_logentry(CH3_FORTRESS,"�������� �� ��������� ����� �� ���� � �������� ���������� ������� �� ��������� ������. ��� �� ���� ����� ���� ��������. �� ����� �������������� �� ���.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FORTRESSFOLLOW");
	AI_StopProcessInfos(self);
};


instance PC_PSIONIC_FOKUSPLACE(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_fokusplace_condition;
	information = pc_psionic_fokusplace_info;
	important = 1;
	permanent = 0;
};


func int pc_psionic_fokusplace_condition()
{
	if(Npc_GetDistToWP(hero,"LOCATION_19_03_PATH_RUIN7") < 400 && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void pc_psionic_fokusplace_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"PC_Psionic_FOKUSPLACE_Info_05_01");	//��������-��, �������, ��� � ���� ������.
	AI_Output(other,self,"PC_Psionic_FOKUSPLACE_Info_15_02");	//��, �������, �� ����, ��... ��� �� ���-�� ����� �������...
	AI_StopProcessInfos(self);
	b_logentry(CH3_FORTRESS,"������, ������� ��� �����, ��������� �� ����������. ��� � �� ����� ��� �������. �� ��� �������� ����� ������ ������� ���.");
	Wld_InsertNpc(harpie,"LOCATION_19_03_ENTRANCE_HARPYE");
	Wld_InsertNpc(harpie,"LOCATION_19_03_ENTRANCE_HARPYE2");
	Wld_InsertNpc(harpie,"LOCATION_19_03_ENTRANCE_HARPYE3");
};


instance PC_PSIONIC_COMEBACK(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_comeback_condition;
	information = pc_psionic_comeback_info;
	important = 1;
	permanent = 0;
};


func int pc_psionic_comeback_condition()
{
	if((Npc_GetDistToWP(hero,"PATH_TO_PLATEAU04_BRIDGE2") < 600) && Npc_KnowsInfo(hero,pc_psionic_followme) && !Npc_HasItems(hero,focus_3) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void pc_psionic_comeback_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"PC_Psionic_COMEBACK_Info_05_01");	//���� �� ��? ���� ������ ��� �� ���������.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"FORTRESSWAIT");
	AI_StopProcessInfos(self);
};


instance PC_PSIONIC_IAMHURT(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_iamhurt_condition;
	information = pc_psionic_iamhurt_info;
	important = 0;
	permanent = 1;
	description = "� �����. �� ������ ������ ���?";
};


func int pc_psionic_iamhurt_condition()
{
	if((hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]) && Npc_KnowsInfo(hero,pc_psionic_followme) && !Npc_KnowsInfo(hero,pc_psionic_finish))
	{
		return TRUE;
	};
};

func void pc_psionic_iamhurt_info()
{
	AI_Output(other,self,"PC_Psionic_IAMHURT_Info_15_01");	//� �����. �� ������ ������ ���?
	if(LESTER_HEAL == 0)
	{
		AI_Output(self,other,"PC_Psionic_IAMHURT_Info_05_02");	//���, ������ ��� ����� �������.
		b_giveinvitems(self,hero,itfo_potion_health_02,1);
		LESTER_HEAL = 1;
	}
	else if(LESTER_HEAL == 1)
	{
		AI_Output(self,other,"PC_Psionic_IAMHURT_Info_05_02");	//���, ������ ��� ����� �������.
		b_giveinvitems(self,hero,itfo_potion_health_02,1);
		LESTER_HEAL = 2;
	}
	else if(LESTER_HEAL == 2)
	{
		AI_Output(self,other,"PC_Psionic_IAMHURT_Info_05_02");	//���, ������ ��� ����� �������.
		b_giveinvitems(self,hero,itfo_potion_health_02,1);
		LESTER_HEAL = 3;
	}
	else
	{
		AI_Output(self,other,"SVM_5_Help");	//����!
	};
	AI_StopProcessInfos(self);
};


instance PC_PSIONIC_URKUNDE(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_urkunde_condition;
	information = pc_psionic_urkunde_info;
	important = 0;
	permanent = 0;
	description = "� ����� ��������.";
};


func int pc_psionic_urkunde_condition()
{
	if(Npc_HasItems(hero,itwr_urkunde_01) && Npc_KnowsInfo(hero,pc_psionic_story))
	{
		return TRUE;
	};
};

func void pc_psionic_urkunde_info()
{
	AI_Output(other,self,"PC_Psionic_URKUNDE_Info_15_01");	//� ����� ��������.
	AI_Output(self,other,"PC_Psionic_URKUNDE_Info_05_02");	//�������! ������ ��� ������ � �������� �������. ��� ������� ���� ��������� �� �������.
	AI_Output(self,other,"PC_Psionic_URKUNDE_Info_05_03");	//� ������� ���� �����, � ����������.
	b_logentry(CH3_FORTRESS,"���������, ������� ����� ������, ���������� � �����. � ����� �� ���� �� ��� ��� ������ ������ ����������. � �� ������� � ����� ������� ������.");
	CreateInvItems(self,itarscrolltelekinesis,4);
	b_giveinvitems(self,hero,itarscrolltelekinesis,4);
	b_giveinvitems(hero,self,itwr_urkunde_01,1);
	Npc_ExchangeRoutine(self,"WaitAtFocus");
	AI_StopProcessInfos(self);
};


instance PC_PSIONIC_TIP(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_tip_condition;
	information = pc_psionic_tip_info;
	important = 0;
	permanent = 0;
	description = "��� �� ��� ������� ���� ������?";
};


func int pc_psionic_tip_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_urkunde) && !Npc_HasItems(hero,focus_3) && !Npc_KnowsInfo(hero,pc_psionic_finish))
	{
		return TRUE;
	};
};

func void pc_psionic_tip_info()
{
	AI_Output(other,self,"PC_Psionic_TIP_Info_15_01");	//��� �� ��� ������� ���� ������?
	AI_Output(self,other,"PC_Psionic_TIP_Info_05_02");	//��� ������ ������� �������: '������� ��������� ����������� �������� ������, � ������ ���������� ���� ������ ����'.
};


instance PC_PSIONIC_LEAVE(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_leave_condition;
	information = pc_psionic_leave_info;
	important = 1;
	permanent = 0;
};


func int pc_psionic_leave_condition()
{
	if(!Npc_HasItems(hero,focus_3) && !Npc_HasItems(self,itwr_urkunde_01) && (Npc_GetDistToWP(hero,"PATH_TO_PLATEAU04_BRIDGE2") < 900) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void pc_psionic_leave_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"PC_Psionic_LEAVE_Info_05_01");	//� �������� ����� � ����� ��������.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"BOOK");
	AI_StopProcessInfos(self);
};


instance PC_PSIONIC_BALKON(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_balkon_condition;
	information = pc_psionic_balkon_info;
	important = 1;
	permanent = 0;
};


func int pc_psionic_balkon_condition()
{
	if(!Npc_HasItems(self,itwr_urkunde_01) && (Npc_GetDistToWP(hero,"LOCATION_19_03_PEMTAGRAM2") < 1000) && (Npc_CanSeeNpcFreeLOS(self,hero)) && (Npc_GetDistToNpc(self,hero) < 1400))
	{
		return TRUE;
	};
};

func void pc_psionic_balkon_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"PC_Psionic_BALKON_Info_05_01");	//�����, ��������, ��� ��� ����.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"BALKON");
};


instance PC_PSIONIC_FINISH(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_finish_condition;
	information = pc_psionic_finish_info;
	important = 1;
	permanent = 0;
};


func int pc_psionic_finish_condition()
{
	if(Npc_HasItems(hero,focus_3) && Npc_KnowsInfo(hero,pc_psionic_urkunde))
	{
		return TRUE;
	};
};

func void pc_psionic_finish_info()
{
	AI_Output(self,other,"PC_Psionic_FINISH_Info_05_01");	//�� ����� ��, ��� ������. � �������� ����� ���������, ���� ������� ��������� �����.
	AI_Output(other,self,"PC_Psionic_FINISH_Info_15_02");	//�� ��� ����������.
	b_logentry(CH3_FORTRESS,"� ������ ������. ������ ������� ��� ��������� �������� � �����, ����� ���������� ����������. ���������, ���������� �� �� ��� �����-������?");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"BOOK");
	AI_StopProcessInfos(self);
};


instance PC_PSIONIC_CHESTCLOSED(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_chestclosed_condition;
	information = pc_psionic_chestclosed_info;
	important = 0;
	permanent = 0;
	description = "�� ����� ���-������?";
};


func int pc_psionic_chestclosed_condition()
{
	if(!Npc_HasItems(hero,focus_3) && !Npc_HasItems(self,itwr_urkunde_01) && (Npc_GetDistToWP(hero,"LOCATION_19_03_SECOND_ETAGE_BALCON") < 500))
	{
		return TRUE;
	};
};

func void pc_psionic_chestclosed_info()
{
	AI_Output(other,self,"PC_Psionic_CHESTCLOSED_Info_15_01");	//�� ����� ���-������?
	AI_Output(self,other,"PC_Psionic_CHESTCLOSED_Info_05_02");	//������ ������. ���� �����, ��� ������� �������� ���� ���-�� ����������.
	AI_Output(self,other,"PC_Psionic_CHESTCLOSED_Info_05_03");	//�� �������� ����� �� ������?
	AI_Output(other,self,"PC_Psionic_CHESTCLOSED_Info_15_04");	//���, ���� �� ����...
	AI_Output(self,other,"PC_Psionic_CHESTCLOSED_Info_05_05");	//� � ���������� �� �� �������?
	AI_StopProcessInfos(self);
};


instance PC_PSIONIC_COMEAGAIN(C_INFO)
{
	npc = pc_psionic;
	condition = pc_psionic_comeagain_condition;
	information = pc_psionic_comeagain_info;
	important = 0;
	permanent = 0;
	description = "�� ����� ��������� ���� ���� ������.";
};


func int pc_psionic_comeagain_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_leave) && !Npc_HasItems(hero,focus_3))
	{
		return TRUE;
	};
};

func void pc_psionic_comeagain_info()
{
	AI_Output(other,self,"PC_Psionic_COMEAGAIN_Info_15_01");	//�� ����� ��������� ���� ���� ������.
	AI_Output(self,other,"PC_Psionic_COMEAGAIN_Info_05_02");	//������, �� ��� ������.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FORTRESSFOLLOW");
	AI_StopProcessInfos(self);
};


instance INFO_LESTER_DIEGOMILTEN(C_INFO)
{
	npc = pc_psionic;
	condition = info_lester_diegomilten_condition;
	information = info_lester_diegomilten_info;
	important = 0;
	permanent = 0;
	description = "��� �����?";
};


func int info_lester_diegomilten_condition()
{
	if(Npc_KnowsInfo(hero,info_diego_ocfavor))
	{
		return TRUE;
	};
};

func void info_lester_diegomilten_info()
{
	AI_Output(hero,self,"Info_SFB_1_DieLage_15_00");	//��� �����?
	AI_Output(self,hero,"PC_Psionic_FOLLOWME_Info_05_01");	//��, ��� �� ����� �������?
	AI_Output(hero,self,"Info_Saturas_COLLAPSE_15_01");	//������ ����� ����������, ����� ���� ��� �� ������ ����!
	AI_Output(self,hero,"DIA_Fingers_BecomeShadow_05_01");	//� ���?
	AI_Output(hero,self,"Info_Xardas_KDW_15_01");	//��� ���� ����� ���� ������!
	AI_Output(hero,self,"Info_Xardas_KDW_15_02");	//����� �� ������� ������.
	AI_Output(self,hero,"SVM_5_GetThingsRight");	//�� ����� �� � ������� � �������� ���������!
	AI_Output(hero,self,"Info_Gorn_DIEGOMILTEN_15_01");	//�������� �� ������� ������ � �������� ����� � ��������.
	AI_Output(hero,self,"Info_lester_DIEGOMILTEN_15_01");	//��� ����� ����������� � �����. �� ����� ������� �����.
	AI_Output(self,hero,"SVM_5_YeahWellDone");	//��� ������!
	AI_Output(other,self,"Info_Gorn_RUINWALLWHAT_15_01");	//��� ��� ������ ������?
	AI_Output(self,hero,"Info_lester_DIEGOMILTEN_05_02");	//� ��� ������� ������ �����, �������� ������ �����.
	AI_Output(hero,self,"KDW_600_Saturas_OATH_Info_15_06");	//��... � �� �������...
	AI_Output(self,hero,"PC_Psionic_TIP_Info_05_02");	//��� ������ ������� �������: '������� ��������� ����������� �������� ������, � ������ ���������� ���� ������ ����'.
	AI_Output(hero,self,"Info_Grd_6_DasLager_WasIstAerger_15_04");	//������, ������. � ��� �����.
	AI_Output(self,hero,"DIA_Fingers_Lehrer_Pickpocket2_05_03");	//���� ���������.
	AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03");	//�������. � ������ ��� ����� �������.
	AI_Output(self,hero,"Info_Lester_EXIT_05_02");	//�� ������ ���� ������!
	b_givexp(XP_MESSAGEFORGORN);
	if(KAPITEL == 6)
	{
		Npc_ExchangeRoutine(self,"Reunion");
	};
	if(WARNED_GORN_OR_LESTER == FALSE)
	{
		WARNED_GORN_OR_LESTER = TRUE;
		b_logentry(CH4_4FRIENDS,"������ ����� ���������� �� ������� � ��������. �������, � ���� ��� ����� � �������.");
	}
	else
	{
		b_logentry(CH4_4FRIENDS,"� ������ ������� � �����, ��� �� ������ ����� � ���� �����������. ����� ������� ��� ����� ����.");
		Log_SetTopicStatus(CH4_4FRIENDS,LOG_SUCCESS);
	};
	AI_StopProcessInfos(self);
};

