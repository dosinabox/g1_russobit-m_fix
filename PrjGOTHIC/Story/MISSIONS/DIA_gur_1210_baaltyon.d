
instance DIA_BAALTYON_EXIT(C_INFO)
{
	npc = gur_1210_baaltyon;
	nr = 999;
	condition = dia_baaltyon_exit_condition;
	information = dia_baaltyon_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_baaltyon_exit_condition()
{
	return 1;
};

func void dia_baaltyon_exit_info()
{
	AI_StopProcessInfos(self);
};


var int baaltyon_ansprechbar;
var int baaltyon_sakrileg;

instance DIA_BAALTYON_NOTALK(C_INFO)
{
	npc = gur_1210_baaltyon;
	nr = 1;
	condition = dia_baaltyon_notalk_condition;
	information = dia_baaltyon_notalk_info;
	permanent = 1;
	important = 1;
};


func int dia_baaltyon_notalk_condition()
{
	if(Npc_IsInState(self,zs_talk) && (BAALTYON_ANSPRECHBAR == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void dia_baaltyon_notalk_info()
{
	Info_ClearChoices(dia_baaltyon_notalk);
	Info_AddChoice(dia_baaltyon_notalk,DIALOG_ENDE,dia_baaltyon_notalk_ende);
	if(Npc_HasItems(other,specialjoint) >= 1)
	{
		Info_AddChoice(dia_baaltyon_notalk,"(���������� ���������� '��� �����')",dia_baaltyon_specialjoint);
	};
	Info_AddChoice(dia_baaltyon_notalk,"� ����� ��� ���������, ��������?",dia_baaltyon_notalk_imp);
	Info_AddChoice(dia_baaltyon_notalk,"�� �������� � ����� ������!",dia_baaltyon_notalk_sleeper);
	Info_AddChoice(dia_baaltyon_notalk,"������! � ����� ���������!",dia_baaltyon_notalk_hi);
};

func void dia_baaltyon_notalk_hi()
{
	AI_Output(other,self,"DIA_BaalTyon_NoTalk_Hi_15_00");	//������! � ����� ���������!
	AI_Output(self,other,"DIA_BaalTyon_NoTalk_Hi_11_01");	//
	BAALTYON_SAKRILEG = TRUE;
};

func void dia_baaltyon_notalk_sleeper()
{
	AI_Output(other,self,"DIA_BaalTyon_NoTalk_Sleeper_15_00");	//�� �������� � ����� ������!
	AI_Output(self,other,"DIA_BaalTyon_NoTalk_Sleeper_11_01");	//
	BAALTYON_SAKRILEG = TRUE;
};

func void dia_baaltyon_notalk_imp()
{
	AI_Output(other,self,"DIA_BaalTyon_NoTalk_Imp_15_00");	//� ����� ��� ���������, ��������?
	AI_Output(self,other,"DIA_BaalTyon_NoTalk_Imp_11_01");	//
	BAALTYON_SAKRILEG = TRUE;
};

func void dia_baaltyon_notalk_ende()
{
	AI_StopProcessInfos(self);
};

func void dia_baaltyon_specialjoint()
{
	AI_Output(other,self,"DIA_BaalTyon_SpecialJoint_15_00");	//���, �������! �������� ������� �� ������� �������...
	AI_StopProcessInfos(self);
	b_giveinvitems(hero,self,specialjoint,1);
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_UseItem(self,specialjoint);
	AI_Output(self,other,"DIA_BaalTyon_SpecialJoint_11_01");	//
	BAALTYON_ANSPRECHBAR = TRUE;
	Npc_SetRefuseTalk(self,5);
	hero.aivar[AIV_INVINCIBLE] = FALSE;
};


instance DIA_BAALTYON_VISION(C_INFO)
{
	npc = gur_1210_baaltyon;
	nr = 1;
	condition = dia_baaltyon_vision_condition;
	information = dia_baaltyon_vision_info;
	permanent = 0;
	important = 1;
};


func int dia_baaltyon_vision_condition()
{
	if((BAALTYON_ANSPRECHBAR == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return 1;
	};
};

func void dia_baaltyon_vision_info()
{
	AI_Output(self,other,"DIA_BaalTyon_Vision_11_00");	//�� ��� �������! � ���� ���� �������!
	AI_Output(self,other,"DIA_BaalTyon_Vision_11_01");	//����������! � �����, ��� � ��� ������������� ����� ����. �� �� ��� ����� �� ���, ��� �������� � ��� �� �����.
	AI_Output(self,other,"DIA_BaalTyon_Vision_11_02");	//�� ���-�� ����� � ����... � ���� ��� ��� ���, � �� ��������� �� ������� ��������. ����� ����� � ������ ������ �� ������.
	AI_Output(self,other,"DIA_BaalTyon_Vision_11_03");	//� ��� �� ��� ����� �� ����. ��� ��? ��� ���� ����� �����?
	AI_Output(other,self,"DIA_BaalTyon_Vision_15_04");	//� ����� ���� �������� ����� �������...
	AI_Output(self,other,"DIA_BaalTyon_Vision_11_05");	//��� � ��� ������. �� �����, ��� ������.
	self.npctype = NPCTYPE_MAIN;
	self.flags = 0;
	BAALTYON_ANSPRECHBAR = FALSE;
	b_logentry(CH1_JOINPSI,"��������� ����� ������� ������� ����� ����� �������� �������! �� �����, ����� � ��������� � ��� �������!");
	b_givexp(XP_IMPRESSEDBAALTYON);
	AI_StopProcessInfos(self);
};

