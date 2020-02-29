
instance DIA_AIDAN_EXIT(C_INFO)
{
	npc = org_859_aidan;
	nr = 999;
	condition = dia_aidan_exit_condition;
	information = dia_aidan_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_aidan_exit_condition()
{
	return 1;
};

func void dia_aidan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AIDAN_HELLO(C_INFO)
{
	npc = org_859_aidan;
	nr = 1;
	condition = dia_aidan_hello_condition;
	information = dia_aidan_hello_info;
	permanent = 0;
	description = "��� �� ����� �������?";
};


func int dia_aidan_hello_condition()
{
	return 1;
};

func void dia_aidan_hello_info()
{
	AI_Output(other,self,"DIA_Aidan_Hello_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Aidan_Hello_13_01");	//� �������. ������� ����� � �����, ��� � ����.
	AI_Output(other,self,"DIA_Aidan_Hello_15_02");	//�� ��� ������ ������?
	AI_Output(self,other,"DIA_Aidan_Hello_13_03");	//��, ����� ������� ������������, ���� �����, ��� ����������� ������.
	Log_CreateTopic(GE_TEACHEROW,LOG_NOTE);
	b_logentry(GE_TEACHEROW,"�����, �������, ������� ����� ������ � ����� ��������, ����� ������� ���� ����������� ������.");
};


instance ORG_859_AIDAN_CREATURES(C_INFO)
{
	npc = org_859_aidan;
	nr = 1;
	condition = org_859_aidan_creatures_condition;
	information = org_859_aidan_creatures_info;
	permanent = 1;
	description = "� ���� ��������� ��������� ����������� ������.";
};


func int org_859_aidan_creatures_condition()
{
	if(Npc_KnowsInfo(hero,dia_aidan_hello) && ((KNOWS_GETTEETH == FALSE) || (KNOWS_GETFUR == FALSE) || (KNOWS_GETCLAWS == FALSE) || (KNOWS_GETHIDE == FALSE)))
	{
		return 1;
	};
};

func void org_859_aidan_creatures_info()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_15_00");	//� ���� ��������� ��������� ����������� ������.
	if((KNOWS_GETTEETH == FALSE) || (KNOWS_GETFUR == FALSE) || (KNOWS_GETCLAWS == FALSE) || (KNOWS_GETHIDE == FALSE))
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_13_01");	//� ���� �� ������ ���������?
		Info_ClearChoices(org_859_aidan_creatures);
		Info_AddChoice(org_859_aidan_creatures,DIALOG_BACK,org_859_aidan_creatures_back);
		if(KNOWS_GETTEETH == FALSE)
		{
			Info_AddChoice(org_859_aidan_creatures,"������ ������ (����: 1 ���� ��������, 50 ������ ����)",org_859_aidan_creatures_zahn);
		};
		if(KNOWS_GETFUR == FALSE)
		{
			Info_AddChoice(org_859_aidan_creatures,"������ ���� (����: 1 ���� ��������, 100 ������ ����)",org_859_aidan_creatures_fell);
		};
		if(KNOWS_GETCLAWS == FALSE)
		{
			Info_AddChoice(org_859_aidan_creatures,"������ ������ (����: 1 ���� ��������, 50 ������ ����)",org_859_aidan_creatures_kralle);
		};
		if(KNOWS_GETHIDE == FALSE)
		{
			Info_AddChoice(org_859_aidan_creatures,"������ ���� �������� (����: 1 ���� ��������, 100 ������ ����)",org_859_aidan_creatures_haut);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_TaughtAll_13_00");	//� ������ ���� �����, ��� ���� ���.
	};
};

func void org_859_aidan_creatures_back()
{
	Info_ClearChoices(org_859_aidan_creatures);
};

func void org_859_aidan_creatures_zahn()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_Zahn_15_00");	//��� �������� �����?
	if(Npc_HasItems(other,itminugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			b_printtrademsg1("������ ����: 50");
			b_giveinvitems(other,self,itminugget,50);
			PrintScreen("�����: ������ ������",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Aidan_Creatures_Zahn_13_01");	//�� ������ ������� �� ���, ����� ����� �� ���������. ����� ����� ��������, ��������� ����� ������ ���.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Zahn_13_02");	//����� ����� ��������� ����� ������, ������� � ����������.
			KNOWS_GETTEETH = TRUE;
			Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
			b_logentry(GE_ANIMALTROPHIES,"����� ������ ������: ����, ������ ������, �����, ����, ������, ��������.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//�� ������ �������� ������ �����, ������ ��� ����-�� ������� � ����.
			PrintScreen("������������ ����� ��������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00");	//������� ������� ���. ��� ���������, ����� ���� ����.
	};
};

func void org_859_aidan_creatures_fell()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_Fell_15_00");	//��� ������� �����?
	if(Npc_HasItems(other,itminugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			b_printtrademsg1("������ ����: 100");
			b_giveinvitems(other,self,itminugget,100);
			PrintScreen("�����: ������ ����",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Aidan_Creatures_Fell_13_01");	//����� �����, ��� �������� ����������� ���� ������� � ������. ����� ����� ������ �������, ������� ������� �� ��������� �� ��� ������.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Fell_13_02");	//�� ���� ������ � ���������� ���� ������� ������. � ��������� � ���� ������ ������ ������������, ������� �� ��� ���� ����� �� ������ ��� ���.
			KNOWS_GETFUR = TRUE;
			Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
			b_logentry(GE_ANIMALTROPHIES,"����� ������ ����: ����, ������ ������, ��������, ������.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//�� ������ �������� ������ �����, ������ ��� ����-�� ������� � ����.
			PrintScreen("������������ ����� ��������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00");	//������� ������� ���. ��� ���������, ����� ���� ����.
	};
};

func void org_859_aidan_creatures_kralle()
{
	if(Npc_HasItems(other,itminugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			b_printtrademsg1("������ ����: 50");
			b_giveinvitems(other,self,itminugget,50);
			PrintScreen("�����: ������ ������",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Aidan_Creatures_Kralle_15_00");	//����� ���� �������� �����.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Kralle_13_01");	//��� �����, ��� ������� �� ������ ������. ����� �������� ������ ������, �� ��� ���� �� �������� ��� ��������� � �� �������� �����.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Kralle_13_02");	//�������, ��������� ����� ����� ������ �� � ������� �����. ������ � ���� ���� ����� ������.
			KNOWS_GETCLAWS = TRUE;
			Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
			b_logentry(GE_ANIMALTROPHIES,"����� ������ ������: �������, �����, ����, ����, ����.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//�� ������ �������� ������ �����, ������ ��� ����-�� ������� � ����.
			PrintScreen("������������ ����� ��������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00");	//������� ������� ���. ��� ���������, ����� ���� ����.
	};
};

func void org_859_aidan_creatures_haut()
{
	if(Npc_HasItems(other,itminugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			b_printtrademsg1("������ ����: 100");
			b_giveinvitems(other,self,itminugget,100);
			PrintScreen("�����: ������ ���� ��������",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Aidan_Creatures_Haut_15_00");	//��� ��� ����� �����, ����� �������� ����� ��������?
			AI_Output(self,other,"Org_859_Aidan_Creatures_Haut_13_01");	//��� ����� �������� �� ������ ��������, � ���� ����� � ����������.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Haut_13_02");	//���� �� ��������� ����� �� �����, �� �� ������� ����� �� �����. ������ �� ������� ����� ����������� � ���� �������.
			KNOWS_GETHIDE = TRUE;
			Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
			b_logentry(GE_ANIMALTROPHIES,"����� ������ ���� ��������: ����, ���������.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//�� ������ �������� ������ �����, ������ ��� ����-�� ������� � ����.
			PrintScreen("������������ ����� ��������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00");	//������� ������� ���. ��� ���������, ����� ���� ����.
	};
};

