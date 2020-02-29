
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
	b_printtrademsg1("������� �������� (50).");
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_02");	//�� ������ ��������� � �������, �� ������ ������� ������, ���� �� � ���� ��� �� ���.
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_03");	//����� ��� ������� ������ ���-���� ��������� ������� ���������. ����� ��������, ��� �� �������� ��������, ����.
	b_giveinvitems(self,other,itmi_plants_swampherb_01,50);
	b_logentry(CH1_DELIVERWEED,"����� ������� ��� ������� ������ ��������� ��� ��� ������.");
	b_givexp(XP_WEEDFROMBALOR);
	if(!Npc_KnowsInfo(hero,dia_viran_what) && !Npc_KnowsInfo(hero,dia_viran_fetchweed))
	{
		b_logentry(CH1_DELIVERWEED,"�� ������ ������, �� ������ ������� ������ ���� ��� ���� ������ ��������� ���������. � �� ���������� ��� ������� ����� �����. ������ ��� �������� ����������� ��� ������ � ����������� �� ��������� �� ����� �����������.");
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
	AI_Output(other,self,"DIA_Balor_SellUnder_15_00");	//�� ��� � ����? � �����... ���� ��� ��� ������? ������� ����-��?
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
	if((BALOR_PLAYERCHEATING == TRUE) && (BALOR_TELLSNCDEALER == FALSE) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_balor_telldealer_info()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_15_00");	//� ����. ��� ���� � ����� ������ ����� ������� ��������?
	AI_Output(self,other,"DIA_Balor_TellDealer_01_01");	//�������, � ������ ���� ����� ��������, � �� ������� � ����� ������. ���� �� �������!
	AI_Output(self,other,"DIA_Balor_TellDealer_01_02");	//��� ����� �������, ��������� ������ ����. ����� � ���������.
	Info_ClearChoices(dia_balor_telldealer);
	Info_AddChoice(dia_balor_telldealer,"������ �� ����.",dia_balor_telldealer_forgetit);
	Info_AddChoice(dia_balor_telldealer,"��������� ������? ������, �����.",dia_balor_telldealer_pay);
};

func void dia_balor_telldealer_pay()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_Pay_15_00");	//��������� ������? ������, �����.
	if(Npc_HasItems(other,itminugget) >= 50)
	{
		b_printtrademsg1("������ ����: 50");
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_01_01");	//��� �... ������. ��� ����� ������. �� ����� ��� ����� ����� � ���� �� �����.
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_01_02");	//�� ���� � ��� ���������. ������, ����� �� ���� �� �������.
		b_printtrademsg2("������� ����� � ������.");
		Info_ClearChoices(dia_balor_telldealer);
		Npc_RemoveInvItems(other,itminugget,50);
		CreateInvItems(other,weedpack,1);
		BALOR_TELLSNCDEALER = TRUE;
		b_logentry(CH1_DELIVERWEED,"����� ������ ��� �������� �� ������ ������. ��� ����� ������. � ����� ����� ��� � ���� �� �����. ���� ����� ����� ����������, ���� � ������ �������� �� �������.");
		b_givexp(XP_BALORNAMEDCIPHER);
		Log_CreateTopic(GE_TRADERNC,LOG_NOTE);
		b_logentry(GE_TRADERNC,"������ ������� � �������� ������ ������. �� ������������ �������� �������� ���������. ��� ����� ����� � ���� �� ����� ����� ������ ������.");
		b_logentry(GE_TRADERNC,"� ����������� � �������. ������ ��������� ���� �� ����� �������� ��� ���� ����� � ������� ���������, ������� � ����� ������� ������� �������.");
		BALOR_BOTENDAY = Wld_GetDay();
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
	permanent = 1;
	description = "��� ����� �. ��� ����� ������� ��������� ������.";
};


func int dia_balor_ripoff_condition()
{
	if(Npc_KnowsInfo(hero,dia_balor_fetchweed) && (BALOR_CAN_GIVE == TRUE) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void dia_balor_ripoff_info()
{
	AI_Output(other,self,"DIA_Balor_RipOff_15_00");	//��� ����� �. ��� ����� ������� ��������� ������.
	if((BALOR_BOTENDAY <= (Wld_GetDay() - 2)))
	{
		if(BALOR_TELLSNCDEALER == TRUE)
		{
			AI_Output(self,other,"DIA_Balor_RipOff_01_01");	//��� ��! ����� ����� ������� ��� � ����� ������.
			AI_Output(self,other,"DIA_Balor_RipOff_01_02");	//��� ��� �������: ��������� ������ ����.
			Info_ClearChoices(dia_balor_ripoff);
			Info_AddChoice(dia_balor_ripoff,"������ �� ����.",dia_balor_telldealer_forgetit2);
			Info_AddChoice(dia_balor_ripoff,"�����, ��� ���� ����!",dia_balor_telldealer_pay2);
		}
		else
		{
			AI_Output(self,other,"DIA_Balor_RipOff_01_03");	//�, ��� ����� ��? �����, ����, �� ������ �� ������� ��� ��������!
			b_printtrademsg1("������� �������� (50).");
			AI_Output(other,self,"DIA_Balor_RipOff_15_04");	//�� ��� ��, � � �� ���������.
			CreateInvItems(self,itmi_plants_swampherb_01,50);
			b_giveinvitems(self,hero,itmi_plants_swampherb_01,50);
			BALOR_CAN_GIVE = FALSE;
			BALOR_BOTENDAY = Wld_GetDay();
		};
	}
	else
	{
		if(BALOR_TELLSNCDEALER == TRUE)
		{
			AI_PlayAni(self,"T_SEARCH");
		};
		AI_Output(self,other,"SVM_1_NotNow");	//� �����!
		AI_StopProcessInfos(self);
	};
};

func void dia_balor_telldealer_pay2()
{
	AI_Output(other,self,"Info_Grd_237_FirstWarn_15_06");	//�����, ��� ���� ����!
	if(Npc_HasItems(other,itminugget) >= 50)
	{
		b_printtrademsg1("������ ����: 50");
		b_printtrademsg2("������� ����� � ������.");
		Info_ClearChoices(dia_balor_ripoff);
		Npc_RemoveInvItems(other,itminugget,50);
		CreateInvItems(other,weedpack,1);
		BALOR_BOTENDAY = Wld_GetDay();
		BALOR_CAN_GIVE = FALSE;
	}
	else
	{
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_NoOre_01_00");	//� �� ���� ����. ��������� ������ � �� ������ ������, �����?
		Info_ClearChoices(dia_balor_ripoff);
	};
};

func void dia_balor_telldealer_forgetit2()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_ForgetIt_15_00");	//������ �� ����.
	AI_Output(self,other,"SVM_1_OkayKeepIt");	//������, ��� ������! ������ ����!
	Info_ClearChoices(dia_balor_ripoff);
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

instance BALOR_GETLOST(C_INFO)
{
	npc = nov_1304_balor;
	nr = 1;
	condition = balor_getlost_condition;
	information = balor_getlost_info;
	permanent = 1;
	important = 1;
};

func int balor_getlost_condition()
{
	if(((BALOR_TRADE_COUNT >= 5) || (self.aivar[AIV_WASDEFEATEDBYSC] == TRUE)) && (Npc_IsInState(self,zs_talk)))
	{
		return TRUE;
	};
};

func void balor_getlost_info()
{
	if(Npc_KnowsInfo(hero,dia_balor_fetchweed))
	{
		AI_Output(self,other,"SVM_1_YouDefeatedNOV_Guard");	//�� ���� ����� ���� ������������. ��� ������ �� ����� ������������!
	}
	else
	{
		AI_Output(self,other,"SVM_1_SuckerDefeatedNov_Guard");	//�������, �� ������ ������������ ������� ����� �����������?
	};
	AI_StopProcessInfos(self);
};

