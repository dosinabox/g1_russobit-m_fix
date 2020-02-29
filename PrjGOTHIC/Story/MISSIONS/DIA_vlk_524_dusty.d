
instance DIA_DUSTY_EXIT(C_INFO)
{
	npc = vlk_524_dusty;
	nr = 999;
	condition = dia_dusty_exit_condition;
	information = dia_dusty_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_dusty_exit_condition()
{
	return 1;
};

func void dia_dusty_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DUSTY_HELLO(C_INFO)
{
	npc = vlk_524_dusty;
	nr = 1;
	condition = dia_dusty_hello_condition;
	information = dia_dusty_hello_info;
	permanent = 0;
	description = "������! ��� ����?";
};


func int dia_dusty_hello_condition()
{
	If(KAPITEL < 4)
	{
		return 1;
	};
};

func void dia_dusty_hello_info()
{
	//AI_Output(other,self,"DIA_Dusty_Hello_15_00");	//������! � ���������. ������ ����������, ��� ����?
	AI_Output(other,self,"DIA_Ghorim_MissingHarlok_15_00");	//������! ��� ����?
	AI_Output(self,other,"DIA_Dusty_Hello_03_01");	//��, � �� ���������! ��� ������ � ���� ����� � �����. � ��� � �������?
	AI_Output(self,other,"DIA_Dusty_Hello_03_02");	//��������� ������ ������ ����, �� ������� ���� ���������� ��� �� ������!
	AI_Output(self,other,"DIA_Dusty_Hello_03_03");	//� ������������ � ������ �������� �����. �� ��������� ��� ���-��� ���������� � ������ ���������.
	AI_Output(self,other,"DIA_Dusty_Hello_03_04");	//�����, ����� �� �������������� � ���, ��� �� ����� ����� ���� ����� ������.
};


instance DIA_DUSTY_WHYNOTLEAVE(C_INFO)
{
	npc = vlk_524_dusty;
	nr = 1;
	condition = dia_dusty_whynotleave_condition;
	information = dia_dusty_whynotleave_info;
	permanent = 0;
	description = "���� ���� ����� �� ��������, ������ �� �� ������?";
};


func int dia_dusty_whynotleave_condition()
{
	if(Npc_KnowsInfo(hero,dia_dusty_hello) && (KAPITEL < 4))
	{
		return 1;
	};
};

func void dia_dusty_whynotleave_info()
{
	AI_Output(other,self,"DIA_Dusty_WhyNotLeave_15_00");	//���� ���� ����� �� ��������, ������ �� �� ������?
	AI_Output(self,other,"DIA_Dusty_WhyNotLeave_03_01");	//� �� ������, ��� ��� ��� ������������� ����� �����. � ���� ��� ����� ����. ��� ����� ������. ������ ����� �� ���� � ������ ���������.
	AI_Output(self,other,"DIA_Dusty_WhyNotLeave_03_02");	//�� � ��� ��� � ������ � ��� �� ������. ���� ��� � ������ ����� ������������, � ����� �������� �����.
	GETNEWGUY_STARTED = TRUE;
	Log_CreateTopic(CH1_RECRUITDUSTY,LOG_MISSION);
	Log_SetTopicStatus(CH1_RECRUITDUSTY,LOG_RUNNING);
	b_logentry(CH1_RECRUITDUSTY,"�����, ������� �� ������� ������, ��������� ����� ������. �� ����������� ��� ���, �� �������������� �� ��� � ������ ��������.");
	if(!Npc_KnowsInfo(hero,dia_melvin_hello))
	{
		b_logentry(CH1_RECRUITDUSTY,"��� ������� �������� ����� �����, �������. �� ���� � ������ �� ������ ������ �����.");
	};
};


instance DIA_DUSTY_METMELVIN(C_INFO)
{
	npc = vlk_524_dusty;
	nr = 1;
	condition = dia_dusty_metmelvin_condition;
	information = dia_dusty_metmelvin_info;
	permanent = 0;
	description = "� ��� � ������ ��������� � �������� ��� �������.";
};


func int dia_dusty_metmelvin_condition()
{
	if(Npc_KnowsInfo(hero,dia_dusty_whynotleave) && Npc_KnowsInfo(hero,dia_melvin_hello) && (KAPITEL < 4))
	{
		return 1;
	};
};

func void dia_dusty_metmelvin_info()
{
	AI_Output(other,self,"DIA_Dusty_MetMelvin_15_00");	//� ��� � ������ ��������� � �������� ��� �������.
	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_01");	//������? �� ������� ��� ���-������?
	AI_Output(other,self,"DIA_Dusty_MetMelvin_15_02");	//�������, ��� ��� ������� �����, ����� �� ������, �� ������.
	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_03");	//��! � �� ��� �������� ��� ����? � ���� ���� ���� �����. �� ���� �� ����� ������ ����� �� ��������.
	AI_Output(other,self,"DIA_Dusty_MetMelvin_15_04");	//��� ���? ������?
	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_05");	//��������� ������ ������, ��� � ��������� ���� ������. ��� �� ������ ��� ����� ������� �� ����.
	AI_Output(self,other,"DIA_Dusty_MetMelvin_03_06");	//����� ��� ���� ����������, ����� ��������� �� �� ������ 100 ������ ����.
};


instance DIA_DUSTY_OFFER100ORE(C_INFO)
{
	npc = vlk_524_dusty;
	nr = 1;
	condition = dia_dusty_offer100ore_condition;
	information = dia_dusty_offer100ore_info;
	permanent = 0;
	description = "� ���� � ��� ���� ��� ������, �� ������� ���� �� ����� ������?";
};


func int dia_dusty_offer100ore_condition()
{
	if(Npc_KnowsInfo(hero,dia_dusty_metmelvin) && (KAPITEL < 4))
	{
		return 1;
	};
};

func void dia_dusty_offer100ore_info()
{
	AI_Output(other,self,"DIA_Dusty_Offer100Ore_15_00");	//� ���� � ��� ���� ��� ������, �� ������� ���� �� ����� ������?
	AI_Output(self,other,"DIA_Dusty_Offer100Ore_03_01");	//� �� �������� ���? ������?
	AI_Output(other,self,"DIA_Dusty_Offer100Ore_15_02");	//��, ������ ���, �� �� ���� ����� �� ������ ���� ����� �� ������� � ������ ���������.
	AI_Output(self,other,"DIA_Dusty_Offer100Ore_03_03");	//�� ������ �������, ��� �� ������� ������ �� ����?
};


instance DIA_DUSTY_IWOULDGO(C_INFO)
{
	npc = vlk_524_dusty;
	nr = 1;
	condition = dia_dusty_iwouldgo_condition;
	information = dia_dusty_iwouldgo_info;
	permanent = 0;
	description = "� �� ������ ����, � ����� ������ � �����.";
};


func int dia_dusty_iwouldgo_condition()
{
	if(Npc_KnowsInfo(hero,dia_dusty_offer100ore) && (KAPITEL < 4))
	{
		return 1;
	};
};

func void dia_dusty_iwouldgo_info()
{
	AI_Output(other,self,"DIA_Dusty_IWouldGo_15_00");	//� �� ������ ����, � ����� ������ � �����.
	AI_Output(self,other,"DIA_Dusty_IWouldGo_03_01");	//�� ���� ���������. �� ������, ��� ������ �� ������ �����.
	AI_Output(self,other,"DIA_Dusty_IWouldGo_03_02");	//�� ������ ������, ��� ����� ����������� 100 ������ ���� ��� ����������.
	if(Npc_KnowsInfo(hero,dia_baaltondral_loyality))
	{
		b_logentry(CH1_RECRUITDUSTY,"� ���� ��������� �������� ����� ����� �� ���� � �������� ������. ��� �������� ��������� ����������, ����� ��� ��� ����������. ����� ����� ������� ��� ����� � ����� ��������.");
	}
	else
	{
		b_logentry(CH1_RECRUITDUSTY,"� ���� ��������� �������� ����� ����� �� ���� � �������� ������. ��� �������� ��������� ����������, ����� ��� ��� ����������. ����� ����� ������� ��� ����� � �������.");
	};
	b_givexp(XP_DUSTYJOINED);
};


var int dusty_letsgo;

instance DIA_DUSTY_LETSGO(C_INFO)
{
	npc = vlk_524_dusty;
	nr = 1;
	condition = dia_dusty_letsgo_condition;
	information = dia_dusty_letsgo_info;
	permanent = 1;
	description = "� �����. ������!";
};


func int dia_dusty_letsgo_condition()
{
	if(Npc_KnowsInfo(hero,dia_dusty_iwouldgo) && (GETNEWGUY_DUSTY_MOVING == FALSE) && (KAPITEL < 4))
	{
		return 1;
	};
};

func void dia_dusty_letsgo_info()
{
	AI_Output(other,self,"DIA_Dusty_LetsGo_15_00");	//� �����. ������!
	AI_Output(self,other,"DIA_Dusty_LetsGo_03_01");	//������, �� ������ ����� ����� ������. ����� �������� ��� �� ������, ��� ��������� �� ����� ������.
	AI_Output(self,other,"DIA_Dusty_LetsGo_03_02");	//� ����� �����, ���� ���� ���������� �� �� - � ���� ��� ����� � �������� �����.
	AI_Output(other,self,"DIA_Dusty_LetsGo_15_03");	//�����. ������.
	GETNEWGUY_DUSTY_MOVING = TRUE;
	if(GETNEWGUY_DUSTY_STOPPED == FALSE)
	{
		b_logentry(CH1_RECRUITDUSTY,"����� ����������� ��� �� ������ � �������� �������. ��������� � ����� ����� ������� ����� ��������� � ����� � �����.");
	};
	self.flags = NPC_FLAG_IMMORTAL;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
	AI_StopProcessInfos(self);
};

instance DIA_DUSTY_BYE(C_INFO)
{
	npc = vlk_524_dusty;
	condition = dia_dusty_bye_condition;
	information = dia_dusty_bye_info;
	permanent = 0;
	important = 1;
};


func int dia_dusty_bye_condition()
{
	if(Npc_GetTrueGuild(self) == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_dusty_bye_info()
{
	AI_Output(self,other,"DIA_Dusty_Hello_03_04");	//�����, ����� �� �������������� � ���, ��� �� ����� ����� ���� ����� ������.
	AI_Output(other,self,"VLK_586_Grimes_Exit_Info_15_01");	//����� �����!
	if(Npc_KnowsInfo(hero,dia_baaltondral_dustysuccess))
	{
		Npc_ExchangeRoutine(self,"PREPARERITUAL");
	}
	else
	{
		Npc_ExchangeRoutine(self,"PREPARERITUAL2");
	};
	AI_StopProcessInfos(self);
};

