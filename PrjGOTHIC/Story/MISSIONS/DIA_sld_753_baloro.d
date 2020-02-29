
var int sld_753_baloro_sc_choice;
var int sld_753_baloro_sc_wills_wissen;
var int sld_753_baloro_sc_besorgt_den_kram;

instance DIA_SLD_753_BALORO(C_INFO)
{
	npc = sld_753_baloro;
	condition = dia_sld_753_baloro_condition;
	information = dia_sld_753_baloro_intro_info;
	important = 1;
	permanent = 0;
};


func int dia_sld_753_baloro_condition()
{
	return 1;
};

func void dia_sld_753_baloro_intro_info()
{
	AI_Output(self,other,"DIA_SLD_753_Baloro_Intro_08_01");	//��, ��! � ��� ����?
};


instance DIA_SLD_753_BALORO_WASMEINSTDU(C_INFO)
{
	npc = sld_753_baloro;
	condition = dia_sld_753_baloro_wasmeinstdu_condition;
	information = dia_sld_753_baloro_wasmeinstdu_info;
	important = 0;
	permanent = 0;
	description = "������!  ";
};


func int dia_sld_753_baloro_wasmeinstdu_condition()
{
	return 1;
};

func void dia_sld_753_baloro_wasmeinstdu_info()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_01");	//������!  
	AI_Output(self,other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_02");	//�� ������ �����, ������ ���� ����� ���-�� �����!
	AI_Output(other,self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_03");	//�� ��� �������? ���� �����, �� � ����.
	AI_Output(self,other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_04");	//�������! ������ ����! �����, � � ������ ����!
};


instance DIA_SLD_753_BALORO_WORUMGEHTS(C_INFO)
{
	npc = sld_753_baloro;
	condition = dia_sld_753_baloro_worumgehts_condition;
	information = dia_sld_753_baloro_worumgehts_info;
	important = 0;
	permanent = 0;
	description = "� ��� �� ������� ��� ������?";
};


func int dia_sld_753_baloro_worumgehts_condition()
{
	if(Npc_KnowsInfo(hero,dia_sld_753_baloro_wasmeinstdu) && (SLD_753_BALORO_SC_CHOICE == 0))
	{
		return 1;
	};
};

func void dia_sld_753_baloro_worumgehts_info()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_01");	//� ��� �� ������� ��� ������?
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_01");	//��� ��� ���� �����?
	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_02");	//��, ��� ���������� �� ������� ���, ������ �����-������ ����� ������� ��� ���������� ������� � �����...
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_02");	//�, ��� ��?! ��� �� ������!
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_03");	//���� ���������� ���-��� �������. �����, � ���� ���� ��� ���� �������. � ���� ������� ����� ������, ������� ����� �������� ������ �����!
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_04");	//�� ��� �� ������� ��� ��������� ������. � ������ ����� � ���� � �����! ������������?
	Info_ClearChoices(dia_sld_753_baloro_worumgehts);
	Info_AddChoice(dia_sld_753_baloro_worumgehts,"� ��� ��� ����� ����� �������?",dia_sld_753_baloro_worumgehts_ja);
	Info_AddChoice(dia_sld_753_baloro_worumgehts,"��� ��� �� �����!",dia_sld_753_baloro_exit_info);
};

func void dia_sld_753_baloro_worumgehts_ja()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_05");	//� ��� ��� ����� ����� �������?
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_03");	//��� ����� ������� ������!
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_04");	//������� ��� ���� �����, ��� ������� �������� ������, ���� ������� ����, ��� ������� �����, ��� ����� ���� � ��� ������ ���������.
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_05");	//������ ���, �� �� ���� �� ���������. ��� � ������, ���� ������� ����� �������� ������ �����!
	Info_ClearChoices(dia_sld_753_baloro_worumgehts);
	Info_AddChoice(dia_sld_753_baloro_worumgehts,"�����! � ���������� ��� ��� �����!",dia_sld_753_baloro_worumgehts_jaklar);
	Info_AddChoice(dia_sld_753_baloro_worumgehts,"���� ��� �������� ���� ��������!",dia_sld_753_baloro_exit_info);
};

func void dia_sld_753_baloro_worumgehts_jaklar()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_06");	//�����! � ���������� ��� ��� �����!
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_06");	//�������! ������ �������!
	AI_Output(self,other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_07");	//� �� ������, ��� ����� ���� �����, ��� ������� �������� ������, ���� ������� ����, ��� ������� �����, ��� ����� ���� � ��� ������ ���������.
	AI_Output(other,self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_07");	//�������!
	SLD_753_BALORO_SC_BESORGT_DEN_KRAM = LOG_RUNNING;
	Log_CreateTopic(BALOROS_WAFFE,LOG_MISSION);
	Log_SetTopicStatus(BALOROS_WAFFE,LOG_RUNNING);
	b_logentry(BALOROS_WAFFE,"������ ������, ��� ���� � ������� ��� 5 �����, 2 ������� �������� ������, 5 ������� ����, 3 ������� �����, 2 ����� ���� � 2 ������ ���������, �� ���� ��� �����-�� ������ ������.");
	AI_StopProcessInfos(self);
};


instance DIA_SLD_753_BALORO_HABSNICHTDABEI(C_INFO)
{
	npc = sld_753_baloro;
	condition = dia_sld_753_baloro_habsnichtdabei_condition;
	information = dia_sld_753_baloro_habsnichtdabei_info;
	important = 0;
	permanent = 1;
	description = "� ��� �� ��� ������! �������, ��� �� �����. ���� ����� ��� �����!";
};


func int dia_sld_753_baloro_habsnichtdabei_condition()
{
	if(SLD_753_BALORO_SC_BESORGT_DEN_KRAM == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_sld_753_baloro_habsnichtdabei_info()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_01");	//� ��� �� ��� ������! �������, ��� �� ��� �����. ���� ����� ��� �����!
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_01");	//�����! ������ ���� ��������. ��� ���, ��� �����...
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_02");	//5 �����, 2 ������� �������� ������, 5 ������� ����, 3 ������� �����, 2 ����� ���� � 2 ������ ���������.
	AI_Output(other,self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_02");	//��, ��! �������! �����, �����.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_753_BALORO_HABSDABEI(C_INFO)
{
	npc = sld_753_baloro;
	condition = dia_sld_753_baloro_habsdabei_condition;
	information = dia_sld_753_baloro_habsdabei_info;
	important = 0;
	permanent = 0;
	description = "� ������ ���� ���, ��� �� ������. ��������� ������!";
};


func int dia_sld_753_baloro_habsdabei_condition()
{
	if((SLD_753_BALORO_SC_BESORGT_DEN_KRAM == LOG_RUNNING) && Npc_KnowsInfo(hero,dia_sld_753_baloro_worumgehts) && (SLD_753_BALORO_SC_CHOICE == 0) && (Npc_HasItems(other,itfoapple) >= 5) && (Npc_HasItems(other,itfobooze) >= 2) && (Npc_HasItems(other,itfobeer) >= 5) && (Npc_HasItems(other,itfoloaf) >= 3) && (Npc_HasItems(other,itfocheese) >= 2) && (Npc_HasItems(other,itfo_wineberrys_01) >= 2))
	{
		return 1;
	};
};

func void dia_sld_753_baloro_habsdabei_info()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_habsdabei_Info_15_01");	//���, � ������ ���� ���, ��� �� ������. ���������, ��� ��� � ���� �� ������!
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_01");	//� �� ������� ������ ��� ���, ��� ������!
	CreateInvItems(other,itfoapple,14);
	b_giveinvitems(other,self,itfoapple,19);
	Npc_RemoveInvItems(other,itfobooze,2);
	Npc_RemoveInvItems(other,itfobeer,5);
	Npc_RemoveInvItems(other,itfoloaf,3);
	Npc_RemoveInvItems(other,itfocheese,2);
	Npc_RemoveInvItems(other,itfo_wineberrys_01,2);
	Npc_RemoveInvItems(self,itfoapple,14);
	CreateInvItems(self,itfobooze,2);
	CreateInvItems(self,itfobeer,5);
	CreateInvItems(self,itfoloaf,3);
	CreateInvItems(self,itfocheese,2);
	CreateInvItems(self,itfo_wineberrys_01,2);
	AI_Output(other,self,"DIA_SLD_753_Baloro_habsdabei_Info_15_02");	//� ������ ���, ��� �� ������.
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_02");	//��, �������!
	AI_Output(other,self,"DIA_SLD_753_Baloro_habsdabei_Info_15_03");	//������ ���� �������. ����� ��, ��� ������!
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_03");	//�� ������ �� ����!
	AI_Output(other,self,"DIA_SLD_753_Baloro_habsdabei_Info_15_04");	//���?
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_04");	//�� ������������� �����, ��� � ���� ���-�� ���? �� ��� ����� ������� �� ��� ��� ����. ���� ���� ���� �� ��������! 
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_05");	//����������� ���, ��� �� �� ��� ��� ���! ���� �� � ������ ������ ���� ��������, �� ����� �� ���������!
	AI_Output(self,other,"DIA_SLD_753_Baloro_habsdabei_Info_08_06");	//��, ��� ��� �� �����. ������ � ��� ���� ��� ����� ���, ����� ����� �������� ��������! �������! ����� ����, �� ��� ����������.
	SLD_753_BALORO_SC_BESORGT_DEN_KRAM = LOG_SUCCESS;
	b_givexp(300);
	b_logentry(BALOROS_WAFFE,"��� � �����, ��� �� ������� ���� ��������. ������ ��� �������! ���������� ������ ��� �� ����������.");
	Log_SetTopicStatus(BALOROS_WAFFE,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};


instance DIA_SLD_753_BALORO_LETZTES_WORT(C_INFO)
{
	npc = sld_753_baloro;
	condition = dia_sld_753_baloro_letztes_wort_condition;
	information = dia_sld_753_baloro_letztes_wort_info;
	important = 0;
	permanent = 0;
	description = "��! ����� �� ��� ������! ��� �� ������!";
};


func int dia_sld_753_baloro_letztes_wort_condition()
{
	if(SLD_753_BALORO_SC_BESORGT_DEN_KRAM == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_sld_753_baloro_letztes_wort_info()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_letztes_Wort_Info_15_01");	//��! ����� �� ��� ������! ��� �� ������!
	AI_Output(self,other,"DIA_SLD_753_Baloro_letztes_Wort_Info_08_01");	//���� ����� ���-�� ���? ��������! ������ ����������� ��� �� �����, � ���� ������! �����?
	SLD_753_BALORO_SC_WILLS_WISSEN = 1;
	AI_StopProcessInfos(self);
};


instance DIA_SLD_753_BALORO_SC_WILLS_WISSEN(C_INFO)
{
	npc = sld_753_baloro;
	condition = dia_sld_753_baloro_sc_wills_wissen_condition;
	information = dia_sld_753_baloro_sc_wills_wissen_info;
	important = 0;
	permanent = 0;
	description = "�������, ������� ����� �������� ����!";
};


func int dia_sld_753_baloro_sc_wills_wissen_condition()
{
	if(SLD_753_BALORO_SC_WILLS_WISSEN == 1)
	{
		return 1;
	};
};

func void dia_sld_753_baloro_attack()
{
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,hero);
	AI_StartState(self,zs_attack,1,"");
};

func void dia_sld_753_baloro_sc_wills_wissen_info()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_01");	//�������, ������� ����� �������� ����!
	AI_Output(self,other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_01");	//�� ������� ������������. � ������ ���� ���� �������� ������!
	AI_Output(other,self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_02");	//� �����, �� ���� �� ��� �����!
	AI_Output(self,other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_02");	//��, ��� ������! ��� �� ��-������� �� ���������! � ���� �����������!
	dia_sld_753_baloro_attack();
};


instance DIA_SLD_753_BALORO_EXIT(C_INFO)
{
	npc = sld_753_baloro;
	nr = 999;
	condition = dia_sld_753_baloro_exit_condition;
	information = dia_sld_753_baloro_exit_info;
	important = 0;
	permanent = 1;
	description = "������! � ���� ������ ��� ������� �� ���������.";
};


func int dia_sld_753_baloro_exit_condition()
{
	if((SLD_753_BALORO_SC_WILLS_WISSEN == 0) && (SLD_753_BALORO_SC_BESORGT_DEN_KRAM == 0))
	{
		return 1;
	};
};

func void dia_sld_753_baloro_exit_info()
{
	if(Npc_KnowsInfo(hero,dia_sld_753_baloro_wasmeinstdu) && (SLD_753_BALORO_SC_CHOICE == 0))
	{
		AI_Output(other,self,"DIA_SLD_753_Baloro_Exit_Info_15_01");	//��� ��� �� �����!
		AI_Output(self,other,"DIA_SLD_753_Baloro_Exit_Info_08_02");	//��� �������! � ��� ���� ����!
		SLD_753_BALORO_SC_CHOICE = 1;
	}
	else
	{
		AI_Output(other,self,"DIA_SLD_753_Baloro_Exit_Info_15_03");	//������! � ���� ������ ��� ������� �� ���������.
		AI_Output(self,other,"DIA_SLD_753_Baloro_Exit_Info_08_04");	//�, ��� � ���� ����� ���, ��? ��, ��� ��������!
	};
	AI_StopProcessInfos(self);
};


instance DIA_SLD_753_BALORO_ANGEBOTDOCHANNEHMEN(C_INFO)
{
	npc = sld_753_baloro;
	condition = dia_sld_753_baloro_angebotdochannehmen_condition;
	information = dia_sld_753_baloro_angebotdochannehmen_info;
	important = 0;
	permanent = 0;
	description = "� ��� �������. � �������� ���� �����������.";
};


func int dia_sld_753_baloro_angebotdochannehmen_condition()
{
	if(SLD_753_BALORO_SC_CHOICE == 1)
	{
		return 1;
	};
};

func void dia_sld_753_baloro_angebotdochannehmen_info()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_15_01");	//� ��� �������. � �������� ���� �����������.
	AI_Output(self,other,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_08_01");	//���, ������ ��� ������! �� ������� ���� ����!
	AI_StopProcessInfos(self);
};

