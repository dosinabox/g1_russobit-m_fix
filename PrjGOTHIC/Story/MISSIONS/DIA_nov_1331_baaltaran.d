
instance DIA_BAALTARAN_EXIT(C_INFO)
{
	npc = nov_1331_baaltaran;
	nr = 999;
	condition = dia_baaltaran_exit_condition;
	information = dia_baaltaran_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_baaltaran_exit_condition()
{
	return 1;
};

func void dia_baaltaran_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAALTARAN_GREET(C_INFO)
{
	npc = nov_1331_baaltaran;
	nr = 1;
	condition = dia_baaltaran_greet_condition;
	information = dia_baaltaran_greet_info;
	permanent = 0;
	description = "� ���������. ��� ��?";
};


func int dia_baaltaran_greet_condition()
{
	return 1;
};

func void dia_baaltaran_greet_info()
{
	AI_Output(other,self,"DIA_BaalTaran_Greet_15_00");	//� ���������. � �� ���?
	AI_Output(self,other,"DIA_BaalTaran_Greet_05_01");	//� ���� �����, ���� �� ������ �������. � ������ �� ������ ��������.
};


instance DIA_BAALTARAN_BRUDERSCHAFT(C_INFO)
{
	npc = nov_1331_baaltaran;
	nr = 1;
	condition = dia_baaltaran_bruderschaft_condition;
	information = dia_baaltaran_bruderschaft_info;
	permanent = 0;
	description = "��� ����� �������� �������?";
};


func int dia_baaltaran_bruderschaft_condition()
{
	if(Npc_KnowsInfo(hero,dia_baaltaran_greet))
	{
		return 1;
	};
};

func void dia_baaltaran_bruderschaft_info()
{
	AI_Output(other,self,"DIA_BaalTaran_Bruderschaft_15_00");	//��� ����� �������� �������?
	AI_Output(self,other,"DIA_BaalTaran_Bruderschaft_05_01");	//�� ��� �������� �������� �������������� ����� ����.
	AI_Output(self,other,"DIA_BaalTaran_Bruderschaft_05_02");	//��� ������ ��������� � ������� ������, ����� �����. � ������ ������ � ���� ����� ����� �������.
};


instance DIA_BAALTARAN_SLEEPER(C_INFO)
{
	npc = nov_1331_baaltaran;
	nr = 1;
	condition = dia_baaltaran_sleeper_condition;
	information = dia_baaltaran_sleeper_info;
	permanent = 0;
	description = "��� ����� ������?";
};


func int dia_baaltaran_sleeper_condition()
{
	if(Npc_KnowsInfo(hero,dia_baaltaran_greet))
	{
		return 1;
	};
};

func void dia_baaltaran_sleeper_info()
{
	AI_Output(other,self,"DIA_BaalTaran_Sleeper_15_00");	//��� ����� ������?
	AI_Output(self,other,"DIA_BaalTaran_Sleeper_05_01");	//������ - ��� ���������. �� ������� ���� � �������� ������ ������� �������� ���� ��� �����.
	AI_Output(self,other,"DIA_BaalTaran_Sleeper_05_02");	//� ��� ��� �� ����������� �� ���� �����. ���� ���� ��������� ��� �������.
	AI_Output(self,other,"DIA_BaalTaran_Sleeper_05_03");	//��� ���� �� ������ ��� ������, ��� �������� ���, ��������� ���������� ����� �������� ������������ � ��������. �� ������ ��������� ��� ������!
};


instance DIA_BAALTARAN_LEHRE(C_INFO)
{
	npc = nov_1331_baaltaran;
	nr = 3;
	condition = dia_baaltaran_lehre_condition;
	information = dia_baaltaran_lehre_info;
	permanent = 0;
	description = "��� �� ������ ���������� ��� � ������?";
};


func int dia_baaltaran_lehre_condition()
{
	if(Npc_KnowsInfo(hero,dia_baaltaran_bruderschaft))
	{
		return 1;
	};
};

func void dia_baaltaran_lehre_info()
{
	AI_Output(other,self,"DIA_BaalTaran_Lehre_15_00");	//��� �� ������ ���������� ��� � ������?
	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_01");	//������ �������� �������� �����. � �����, ��� ���� �����, ��� �����, �� ��������� � ���.
	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_02");	//��� ��� ��������� � ����. �� ��� �� �� ����� ����� ��� ��� ���� ����. ��� ��� ������������ ������ ���, �� �����, ����� �������� ��� �����������.
	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_03");	//�� ������ ���, ����� ����� �������� ��� ������, ����� ������������������� ��� ����������� � ���������� �� ���� ����.
	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_04");	//���� ��, ��� ���, ��� ������� � �������, �������� ���� ���� ��������������, � �������� ����� ������ � ���� �����.
	AI_Output(self,other,"DIA_BaalTaran_Lehre_05_05");	//�� ������ ��������, � ������ �������� �������������� ����� ���� ����, ��� ����������� � ���.
};


instance DIA_BAALTARAN_FREIHEIT(C_INFO)
{
	npc = nov_1331_baaltaran;
	nr = 4;
	condition = dia_baaltaran_freiheit_condition;
	information = dia_baaltaran_freiheit_info;
	permanent = 0;
	description = "� ��� ����� ��������� ���� � �������?";
};


func int dia_baaltaran_freiheit_condition()
{
	if(Npc_KnowsInfo(hero,dia_baaltaran_sleeper))
	{
		return 1;
	};
};

func void dia_baaltaran_freiheit_info()
{
	AI_Output(other,self,"DIA_BaalTaran_Freiheit_15_00");	//� ��� ����� ��������� ���� � �������?
	AI_Output(self,other,"DIA_BaalTaran_Freiheit_05_01");	//�� ������� ������� ���������, � ������� ��������� ��� �������� ���� � �������� �������.
	AI_Output(self,other,"DIA_BaalTaran_Freiheit_05_02");	//�� ����� ��������� ��� �������� ������ ��� ���� � �������.
};


instance DIA_BAALTARAN_BEWEIS(C_INFO)
{
	npc = nov_1331_baaltaran;
	nr = 3;
	condition = dia_baaltaran_beweis_condition;
	information = dia_baaltaran_beweis_info;
	permanent = 0;
	description = "���� �� � ���� �������������� ��� ����?";
};


func int dia_baaltaran_beweis_condition()
{
	if(Npc_KnowsInfo(hero,dia_baaltaran_sleeper))
	{
		return 1;
	};
};

func void dia_baaltaran_beweis_info()
{
	AI_Output(other,self,"DIA_BaalTaran_Beweis_15_00");	//���� �� � ���� �������������� ��� ����?
	AI_Output(self,other,"DIA_BaalTaran_Beweis_05_01");	//���� ���� �� ���������� ��� � ��������. ��, ��� ���� ��� ������ ��� �����, ������ ������� �� ����������� � ��� ����.
	AI_Output(self,other,"DIA_BaalTaran_Beweis_05_02");	//�� ������� �� �������� �����, ������� �������� �������������� ������������ � ����� ������� � �������� ���. ��������� �� ��� �������� ����� ��������� �������, ������� �� ��������.
	AI_Output(other,self,"DIA_BaalTaran_Beweis_15_03");	//�������.
};


instance DIA_BAALTARAN_WAYTOST(C_INFO)
{
	npc = nov_1331_baaltaran;
	nr = 1;
	condition = dia_baaltaran_waytost_condition;
	information = dia_baaltaran_waytost_info;
	permanent = 0;
	description = "��� � ���� ����� ������ ��������?";
};


func int dia_baaltaran_waytost_condition()
{
	if(Npc_KnowsInfo(hero,dia_baaltaran_bruderschaft))
	{
		return 1;
	};
};

func void dia_baaltaran_waytost_info()
{
	AI_Output(other,self,"DIA_BaalTaran_WayToST_15_00");	//��� � ���� ����� ������ ��������?
	AI_Output(self,other,"DIA_BaalTaran_WayToST_05_01");	//������ � ���� ����� ���. �� ������ ���������� � ����� �������, ������� ���� ������ � ���� ������.
	AI_Output(self,other,"DIA_BaalTaran_WayToST_05_02");	//��� ����� ����� �������� �� �����, �� ������ ������� �����. ��-�����, � ���� ��� ���� ���� ������.
	if((Npc_GetTrueGuild(hero) == GIL_NONE) && (KAPITEL < 2))
	{
		Log_CreateTopic(CH1_JOINPSI,LOG_MISSION);
		Log_SetTopicStatus(CH1_JOINPSI,LOG_RUNNING);
		b_logentry(CH1_JOINPSI,"��������� �� ����� ���� ������ ����� ������� ���� � �������� ������. � ����� ����� ��� �� �������� ������� �� ������ � ������ ������.");
	};
};


instance DIA_BAALTARAN_INTOCASTLE(C_INFO)
{
	npc = nov_1331_baaltaran;
	nr = 10;
	condition = dia_baaltaran_intocastle_condition;
	information = dia_baaltaran_intocastle_info;
	permanent = 0;
	description = "��� ����� ������� � �����. �� ������ ��� ������?";
};


func int dia_baaltaran_intocastle_condition()
{
	if(Npc_KnowsInfo(hero,dia_baaltaran_greet) && (Npc_HasItems(hero,itwr_fire_letter_01) || Npc_HasItems(hero,itwr_fire_letter_02)))
	{
		return 1;
	};
};

func void dia_baaltaran_intocastle_info()
{
	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_15_00");	//��� ����� ������� � �����. �� ������ ��� ������?
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_05_01");	//�����, ��� ����������. � ����� ����� ������� ������ �� �� ���, ��� ���������� ������ �������� �� ������ ������.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_05_02");	//�� �������� ��� � ����� ������� � ������ �������, � ����� ������ �� ������ �� �������� ����.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_05_03");	//���� �� �� ��� ����� �� ��������, ���������� �� ��� ������, ���� �� ���������� � �����. �� ��� ����� �� ������ �������� � ���� ��������.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_05_04");	//� ��� ���� ����� � �����?
	Info_ClearChoices(dia_baaltaran_intocastle);
	Info_AddChoice(dia_baaltaran_intocastle,"��� ����� ���������� ��� � ����� ���������.",dia_baaltaran_intocastle_meetsomeone);
	Info_AddChoice(dia_baaltaran_intocastle,"� ���� ���� �������� � ���������� ���� ����� ����.",dia_baaltaran_intocastle_letter);
};

func void dia_baaltaran_intocastle_meetsomeone()
{
	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00");	//��� ����� ���������� ��� � ����� ���������.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01");	//��? � ������ �� ���� �� ���������, ���� �� ��� ������ �� �����?
	Info_ClearChoices(dia_baaltaran_intocastle);
	Info_AddChoice(dia_baaltaran_intocastle,"���� ��� ����� �� �����������.",dia_baaltaran_intocastle_forgetit);
	Info_AddChoice(dia_baaltaran_intocastle,"��� ���� �� �����.",dia_baaltaran_intocastle_mage);
};

func void dia_baaltaran_intocastle_letter()
{
	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_Letter_15_00");	//� ���� ���� �������� � ���������� ���� ����� ����.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Letter_05_01");	//������? � ������ ��� � ����? ��� ���� ���� ����, �� ���� ��� �� ����� � ��� ������, ��?
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Letter_05_02");	//���� �� ������� ������������ �� ����. �� �� �������� - ��� � ������ ������ �� �����.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Letter_05_03");	//�� ���� ����������� ������������ �� ������ � ��� ������, ������? ��-�� ���� ���� ����� ����� �� �����.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Letter_05_04");	//������� ��������� �������� �������, ���������� �����, ������������ ������ �� �������� ����.
	if(LETTER_TOLD == 0)
	{
		LETTER_TOLD = 1;
	}
	else if(LETTER_TOLD == 1)
	{
		LETTER_TOLD = 2;
		if(!Npc_IsDead(vlk_505_buddler))
		{
			b_exchangeroutine(vlk_505_buddler,"letterwait");
		};
		if(!Npc_IsDead(vlk_506_buddler))
		{
			b_exchangeroutine(vlk_506_buddler,"letterwait");
		};
	};
	Info_ClearChoices(dia_baaltaran_intocastle);
};

func void dia_baaltaran_intocastle_mage()
{
	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_Mage_15_00");	//��� ���� �� �����.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Mage_05_01");	//�! ���� ������� �� ������� �� �����. ���� ������ �������� ����� ������ ������� � ���.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Mage_05_02");	//����� �� �� ���� �����? �������, ����� ������ ���������� ���� ��� �����?
	Info_ClearChoices(dia_baaltaran_intocastle);
	Info_AddChoice(dia_baaltaran_intocastle,"���� ��� ����� �� �����������.",dia_baaltaran_intocastle_forgetit);
	Info_AddChoice(dia_baaltaran_intocastle,"�����, �� ������.",dia_baaltaran_intocastle_exactly);
};

func void dia_baaltaran_intocastle_forgetit()
{
	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00");	//���� ��� ����� �� �����������.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01");	//��� ������, ����. � �� ������ ����� ������...
	Info_ClearChoices(dia_baaltaran_intocastle);
};

func void dia_baaltaran_intocastle_exactly()
{
	AI_Output(other,self,"DIA_BaalTaran_IntoCastle_Exactly_15_00");	//�����, �� ������.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Exactly_05_01");	//� ��� � �������! ��� �� ��� ����� �� ����� ������ �������� ��� ��.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Exactly_05_02");	//��� ���� �����: ������ �� ���� �����. �� ������ ���� �� �� �������.
	AI_Output(self,other,"DIA_BaalTaran_IntoCastle_Exactly_05_03");	//� ����� ������ ��� ��� ���� � ����� ����� ������� �������.
	Info_ClearChoices(dia_baaltaran_intocastle);
};

