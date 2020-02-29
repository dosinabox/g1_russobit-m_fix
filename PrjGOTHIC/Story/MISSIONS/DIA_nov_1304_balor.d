
instance DIA_BALOR_EXIT(C_INFO)
{
	npc = nov_1304_balor;
	nr = 999;
	condition = dia_viran_exit_condition;
	information = dia_viran_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_balor_exit_condition()
{
	return 1;
};

func void dia_balor_exit_info()
{
	AI_StopProcessInfos(self);
};


var int balor_botenday;

instance DIA_BALOR_FETCHWEED(C_INFO)
{
	npc = nov_1304_balor;
	nr = 1;
	condition = dia_balor_fetchweed_condition;
	information = dia_balor_fetchweed_info;
	permanent = 0;
	description = "���� ������� ���� ���� �� ������� ���������.";
};


func int dia_balor_fetchweed_condition()
{
	if(BAALORUN_FETCHWEED == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_balor_fetchweed_info()
{
	AI_Output(other,self,"DIA_Balor_FetchWeed_15_00");	//���� ������� ���� ���� �� ������� ���������.
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_01");	//������. ��� �� �������� �������� ��� ������. ���, ������ ���.
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_02");	//�� ������ ��������� � �������, �� ������ ������� ������, ���� �� � ���� ��� �� ���.
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_03");	//����� ��� ������� ������ ���-���� ��������� ������� ���������. ����� ��������, ��� �� �������� ��������.
	b_giveinvitems(self,other,itmi_plants_swampherb_01,50);
	b_logentry(CH1_DELIVERWEED,"����� ������� ��� ������� ������ ��������� ��� ��� ������.");
	b_givexp(XP_WEEDFROMBALOR);
	if(!Npc_KnowsInfo(hero,dia_viran_what) && !Npc_KnowsInfo(hero,dia_viran_fetchweed))
	{
		b_logentry(CH1_DELIVERWEED,"�� ������ ������ �� ������ ������� ������ ���� ��� ���� ������ ��������� ���������. � �� ���������� ��� ������� ����� �����. ������ ��� �������� ����������� ��� ������ � ����������� �� ��������� �� ����� �����������.");
	};
	BALOR_BOTENDAY = Wld_GetDay();
};


var int balor_playercheating;

instance DIA_BALOR_SELLUNDER(C_INFO)
{
	npc = nov_1304_balor;
	nr = 1;
	condition = dia_balor_sellunder_condition;
	information = dia_balor_sellunder_info;
	permanent = 0;
	description = "�� ��� � ����? � �����... ���� ��� ��� ������? ������� ����-��?";
};


func int dia_balor_sellunder_condition()
{
	if(Npc_KnowsInfo(hero,dia_balor_fetchweed))
	{
		return 1;
	};
};

func void dia_balor_sellunder_info()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_15_00");	//�� ��� � ����? � �����: ���� ��� ��� ������? ������� ����-��?
	AI_Output(self,other,"DIA_Balor_SellUnder_01_01");	//�, � ��������� ���� ������� ����, ��?
	Info_ClearChoices(dia_balor_sellunder);
	Info_AddChoice(dia_balor_sellunder,"������, ��� ���� ������ �����.",dia_balor_sellunder_forgetit);
	Info_AddChoice(dia_balor_sellunder,"���� �� �� ���� ����, ��� ��� ��� ������, �� �������� �� �������.",dia_balor_sellunder_halfhalf);
	Info_AddChoice(dia_balor_sellunder,"���, ������ �����, ��� ��.",dia_balor_sellunder_comeon);
};

func void dia_balor_sellunder_forgetit()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_ForgetIt_15_00");	//������, ��� ���� ������ �����.
	Info_ClearChoices(dia_balor_sellunder);
};

func void dia_balor_sellunder_halfhalf()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_HalfHalf_15_00");	//���� �� �� ���� ����, ��� ��� �� ��� ������, �� ����� �� �������� ������� �������.
	AI_Output(self,other,"DIA_Balor_SellUnder_HalfHalf_01_01");	//��, ���� � ����� ������ �������, �������� ��� �� �������������� ���� ���������...
	AI_Output(self,other,"DIA_Balor_SellUnder_HalfHalf_01_02");	//�� ���� ���� ������ �� ����, ��� ������� ���� �����������! ��� ��� � ������ �� ����, ����?!
	BALOR_PLAYERCHEATING = TRUE;
	Info_ClearChoices(dia_balor_sellunder);
};

func void dia_balor_sellunder_comeon()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_ComeOn_15_00");	//���, ������ �����, ��� ��.
	AI_Output(self,other,"DIA_Balor_SellUnder_ComeOn_01_01");	//���, ���� �������! ��, ��� ��� � ���� �����: ���� ��� ����� �� ������� �����, ���������� ��� �����! � ��� ����� �� ������.
};


var int balor_tellsncdealer;

instance DIA_BALOR_TELLDEALER(C_INFO)
{
	npc = nov_1304_balor;
	nr = 1;
	condition = dia_balor_telldealer_condition;
	information = dia_balor_telldealer_info;
	permanent = 1;
	description = "� ����. ��� ���� � ����� ������ ����� ������� ��������?";
};


func int dia_balor_telldealer_condition()
{
	if((BALOR_PLAYERCHEATING == TRUE) && (BALOR_TELLSNCDEALER == FALSE))
	{
		return 1;
	};
};

func void dia_balor_telldealer_info()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_15_00");	//� ����. ��� ���� � ����� ������ ����� ������� ��������?
	AI_Output(self,other,"DIA_Balor_TellDealer_01_01");	//�������, � ������ ���� ����� ��������, � �� ������� � ����� ������. ���� �� �������!
	AI_Output(self,other,"DIA_Balor_TellDealer_01_02");	//��� ����� ������� ��������� ������ ����. ����� � ���������.
	Info_ClearChoices(dia_balor_telldealer);
	Info_AddChoice(dia_balor_telldealer,"������ �� ����.",dia_balor_telldealer_forgetit);
	Info_AddChoice(dia_balor_telldealer,"��������� ������? ������, �����.",dia_balor_telldealer_pay);
};

func void dia_balor_telldealer_pay()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_Pay_15_00");	//��������� ������? ������, �����.
	if(Npc_HasItems(other,itminugget) >= 50)
	{
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_01_01");	//��� �... ������. ��� ����� ������. �� ����� ��� ����� ����� � ���� �� �����.
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_01_02");	//�� ���� � ��� ���������. ������, ����� �� ���� �� �������.
		Info_ClearChoices(dia_balor_telldealer);
		b_giveinvitems(other,self,itminugget,50);
		BALOR_TELLSNCDEALER = TRUE;
		b_logentry(CH1_DELIVERWEED,"����� ������ ��� �������� �� ������ ������. ��� ����� ������. � ����� ����� ��� � ���� �� �����. ���� ����� ����� ����������, ���� � ������ �������� �� �������.");
		b_givexp(XP_BALORNAMEDCIPHER);
		Log_CreateTopic(GE_TRADERNC,LOG_NOTE);
		b_logentry(GE_TRADERNC,"������ ������� � �������� ������ ������. �� ������������ �������� �������� ���������. ��� ����� ����� � ���� �� �����.");
	}
	else
	{
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_NoOre_01_00");	//� �� ���� ����. ��������� ������ � �� ������ ������, �����?
		Info_ClearChoices(dia_balor_telldealer);
	};
};

func void dia_balor_telldealer_forgetit()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_ForgetIt_15_00");	//������ �� ����.
	AI_Output(self,other,"DIA_Balor_TellDealer_ForgetIt_01_01");	//�� �����, ��� ����� ��� ��� ������ ��������� � ����� ������ � ������� ���� �������� ������� ����������! ���� �� ������ ������� ��������, � ���� ������ �� ������.
	AI_Output(self,other,"DIA_Balor_TellDealer_ForgetIt_01_02");	//�� ������ ���������� ��� �� ���� ��������, � � ���� ��� �������.
	Info_ClearChoices(dia_balor_telldealer);
};


instance DIA_BALOR_RIPOFF(C_INFO)
{
	npc = nov_1304_balor;
	nr = 5;
	condition = dia_balor_ripoff_condition;
	information = dia_balor_ripoff_info;
	permanent = 0;
	description = "��� ����� �. ��� ����� ������� ��������� ������.";
};


func int dia_balor_ripoff_condition()
{
	if((BALOR_BOTENDAY <= (Wld_GetDay() - 2)) && Npc_KnowsInfo(hero,dia_balor_fetchweed))
	{
		return 1;
	};
};

func void dia_balor_ripoff_info()
{
	AI_Output(other,self,"DIA_Balor_RipOff_15_00");	//��� ����� �. ��� ����� ������� ��������� ������.
	if(BALOR_PLAYERCHEATING == TRUE)
	{
		AI_Output(self,other,"DIA_Balor_RipOff_01_01");	//��� ��! ����� ����� ������� ��� � ����� ������.
		AI_Output(self,other,"DIA_Balor_RipOff_01_02");	//��� ��� ������� ��������� ������ ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Balor_RipOff_01_03");	//�, ��� ����� ��? �����, ����, �� ������ �� ������� ��� ��������!
		AI_Output(other,self,"DIA_Balor_RipOff_15_04");	//�� ��� ��, � � �� ���������.
		CreateInvItems(self,itmi_plants_swampherb_01,50);
		b_giveinvitems(self,hero,itmi_plants_swampherb_01,50);
	};
};


instance DIA_BALOR_PERM(C_INFO)
{
	npc = nov_1304_balor;
	nr = 1;
	condition = dia_balor_perm_condition;
	information = dia_balor_perm_info;
	permanent = 1;
	description = "��� �, ������� ������.";
};


func int dia_balor_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_balor_fetchweed))
	{
		return 1;
	};
};

func void dia_balor_perm_info()
{
	AI_Output(other,self,"DIA_Balor_Perm_15_00");	//��� �, ������� ������.
	AI_Output(self,other,"DIA_Balor_Perm_01_01");	//�������, � ��� ���, ��-������, ����� �����? ������� � ������?
};

