
instance DIA_BAALNAMIB_EXIT(C_INFO)
{
	npc = gur_1204_baalnamib;
	nr = 999;
	condition = dia_baalnamib_exit_condition;
	information = dia_baalnamib_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_baalnamib_exit_condition()
{
	return 1;
};

func void dia_baalnamib_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAALNAMIB_NOTALK(C_INFO)
{
	npc = gur_1204_baalnamib;
	nr = 1;
	condition = dia_baalnamib_notalk_condition;
	information = dia_baalnamib_notalk_info;
	permanent = 1;
	important = 1;
};


func int dia_baalnamib_notalk_condition()
{
	if(Npc_IsInState(self,zs_talk) && (BAALNAMIB_ANSPRECHBAR == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void dia_baalnamib_notalk_info()
{
	Info_ClearChoices(dia_baalnamib_notalk);
	Info_AddChoice(dia_baalnamib_notalk,DIALOG_ENDE,dia_baalnamib_notalk_ende);
	Info_AddChoice(dia_baalnamib_notalk,"� ����� ��� ���������, ��������?",dia_baalnamib_notalk_imp);
	Info_AddChoice(dia_baalnamib_notalk,"�� �������� � ����� ������!",dia_baalnamib_notalk_sleeper);
	Info_AddChoice(dia_baalnamib_notalk,"������! � ����� ���������!",dia_baalnamib_notalk_hi);
};

func void dia_baalnamib_notalk_hi()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Hi_15_00");	//������! � ����� ���������!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Hi_02_01");	//
	BAALNAMIB_SAKRILEG = TRUE;
};

func void dia_baalnamib_notalk_sleeper()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Sleeper_15_00");	//�� �������� � ����� ������!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Sleeper_02_01");	//
	BAALNAMIB_SAKRILEG = TRUE;
};

func void dia_baalnamib_notalk_imp()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Imp_15_00");	//� ����� ��� ���������, ��������?
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Imp_02_01");	//
	BAALNAMIB_SAKRILEG = TRUE;
};

func void dia_baalnamib_notalk_ende()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAALNAMIB_FIRSTTALK(C_INFO)
{
	npc = gur_1204_baalnamib;
	nr = 1;
	condition = dia_baalnamib_firsttalk_condition;
	information = dia_baalnamib_firsttalk_info;
	permanent = 0;
	important = 1;
};


func int dia_baalnamib_firsttalk_condition()
{
	if((BAALNAMIB_ANSPRECHBAR == TRUE) && (Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		return 1;
	};
};

func void dia_baalnamib_firsttalk_info()
{
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_02_00");	//
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_02_01");	//������ ������ ����. �� � � ����� ���� ������ �������������� � ���?
	Info_ClearChoices(dia_baalnamib_firsttalk);
	Info_AddChoice(dia_baalnamib_firsttalk,"(����������)",dia_baalnamib_firsttalk_mute);
	Info_AddChoice(dia_baalnamib_firsttalk,"��, � ���� �������� �� ����, ��������� ������.",dia_baalnamib_firsttalk_sleeper);
};

func void dia_baalnamib_firsttalk_mute()
{
	//AI_Output(other,self,"DIA_BaalNamib_FirstTalk_Mute_15_00");	//
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_Mute_02_01");	//��?
};

func void dia_baalnamib_firsttalk_sleeper()
{
	AI_Output(other,self,"DIA_BaalNamib_FirstTalk_Sleeper_15_00");	//��, � ���� �������� �� ����, ��������� ������.
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_Sleeper_02_01");	//��� � ��� ������. ����� ���, ��� � ������ ���� ������� ��������!
	Info_ClearChoices(dia_baalnamib_firsttalk);
	Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
	Log_SetTopicStatus(CH1_JOINPSI,LOG_RUNNING);
	b_logentry(CH1_JOINPSI,"������� ������� �������. ���� ����� ��������� �� ����. ������ �� ������, ��� � ���� ���������� ��������. ��� ����� ������� ���� ��� ������ � �����������!");
	b_givexp(XP_IMPRESSBAALNAMIB);
};


var int baalnamib_armor_h_was_bought;

instance GUR_1204_BAALNAMIB_ARMOR(C_INFO)
{
	npc = gur_1204_baalnamib;
	condition = gur_1204_baalnamib_armor_condition;
	information = gur_1204_baalnamib_armor_info;
	important = 0;
	permanent = 1;
	description = "��� ����� ������� �������.";
};


func int gur_1204_baalnamib_armor_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_NOV) && (BAALNAMIB_ARMOR_H_WAS_BOUGHT != 1))
	{
		return TRUE;
	};
};

func void gur_1204_baalnamib_armor_info()
{
	AI_Output(hero,self,"GUR_1204_BaalNamib_ARMOR_Info_15_01");	//��� ����� ������� �������.
	AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_04");	//��� ������� ������� ���� ����, ��� �� ��� ������ �������� ���� ����!
	Info_ClearChoices(gur_1204_baalnamib_armor);
	Info_AddChoice(gur_1204_baalnamib_armor,DIALOG_BACK,gur_1204_baalnamib_armor_back);
	Info_AddChoice(gur_1204_baalnamib_armor,b_buildbuyarmorstring("������ ����������, ������: 40/5/20/0",VALUE_NOV_ARMOR_H),gur_1204_baalnamib_armor_buy);
};

func void gur_1204_baalnamib_armor_back()
{
	Info_ClearChoices(gur_1204_baalnamib_armor);
};

func void gur_1204_baalnamib_armor_buy()
{
	if(Npc_HasItems(hero,itminugget) < VALUE_NOV_ARMOR_H)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_03");	//�����������, ����� �������� ���������� ����.
		Info_ClearChoices(gur_1204_baalnamib_armor);
	}
	else
	{
		AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_TakeIt_15_00");	//������, � ������� ���.
		b_printtrademsg1("������ ����: 1200");
		AI_Output(self,other,"SVM_2_OkayKeepIt");	//������. ��� ����.
		b_printtrademsg2("������� ������ ����������.");
		b_giveinvitems(hero,self,itminugget,VALUE_NOV_ARMOR_H);
		CreateInvItem(self,nov_armor_h);
		b_giveinvitems(self,hero,nov_armor_h,1);
//		AI_EquipArmor(hero,nov_armor_h);
		BAALNAMIB_ARMOR_H_WAS_BOUGHT = 1;
		Info_ClearChoices(gur_1204_baalnamib_armor);
	};
};

