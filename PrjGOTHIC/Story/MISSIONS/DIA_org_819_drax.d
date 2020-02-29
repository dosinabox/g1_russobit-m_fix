
instance ORG_819_DRAX_EXIT(C_INFO)
{
	npc = org_819_drax;
	nr = 999;
	condition = org_819_drax_exit_condition;
	information = org_819_drax_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int org_819_drax_exit_condition()
{
	return 1;
};

func void org_819_drax_exit_info()
{
	AI_StopProcessInfos(self);
};


instance ORG_819_DRAX_HUNTHERE(C_INFO)
{
	npc = org_819_drax;
	nr = 1;
	condition = org_819_drax_hunthere_condition;
	information = org_819_drax_hunthere_info;
	permanent = 0;
	description = "�� �������, ��?";
};


func int org_819_drax_hunthere_condition()
{
	return 1;
};

func void org_819_drax_hunthere_info()
{
	AI_Output(other,self,"Org_819_Drax_HuntHere_15_00");	//�� �������, ��?
	AI_Output(self,other,"Org_819_Drax_HuntHere_06_01");	//�������, ��... � ��� ���� �����?
	AI_Output(other,self,"Org_819_Drax_HuntHere_15_02");	//�� ������ ���������� ���, ��� ����� ���������?
	AI_Output(self,other,"Org_819_Drax_HuntHere_06_03");	//� ���� ������� ����, �� ��� ����� ���� ����.
	AI_Output(other,self,"Org_819_Drax_HuntHere_15_04");	//� ������ ��� ����?
	AI_Output(self,other,"Org_819_Drax_HuntHere_06_05");	//��� ������ ������� ����, � ��� ���������.
};


var int drax_bierbekommen;
var int drax_lehrer_frei;

instance ORG_819_DRAX_SCAVENGER(C_INFO)
{
	npc = org_819_drax;
	nr = 1;
	condition = org_819_drax_scavenger_condition;
	information = org_819_drax_scavenger_info;
	permanent = 1;
	description = "��� ���� ����. ��� �� ���������� ��� �� �����?";
};


func int org_819_drax_scavenger_condition()
{
	if(Npc_KnowsInfo(hero,org_819_drax_hunthere) && (DRAX_BIERBEKOMMEN == FALSE))
	{
		return 1;
	};
};

func void org_819_drax_scavenger_info()
{
	if(Npc_HasItems(other,itfobeer) > 0)
	{
		b_giveinvitems(other,self,itfobeer,1);
		AI_Output(other,self,"Org_819_Drax_Scavenger_15_00");	//��� ���� ����. ��� �� ���������� ��� �� �����?
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,itfobeer);
		AI_Output(self,other,"Org_819_Drax_Scavenger_06_01");	// ��� ����� �������� �������� �������. �� �������� �� ������������. ��������� �� ����� ����������. �������� ���������� �� ���� ����� ��������.
		AI_Output(self,other,"Org_819_Drax_Scavenger_06_02");	//����� �� ��������� �����, ����� �������������, � ����� ������������ �������� �� ����. ����� ������ ��������.
		AI_Output(self,other,"Org_819_Drax_Scavenger_06_03");	//������ ���� ������. ��������� �����������, � � ���� ����� ����������� ������������. ����� �� � ��������� ��� ��������.
		AI_Output(self,other,"Org_819_Drax_Scavenger_06_04");	//��, � ���� �� ������ ���� ������, �����... �� ����� ����� �� ���������.
		DRAX_BIERBEKOMMEN = TRUE;
	}
	else
	{
		AI_Output(other,self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00");	//� ���� ��� ����.
		AI_Output(self,other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01");	//��� ���� ���. ��� ��� ��������� ���������� ����� �� �������. � ����� ��������� � �����, �������� ������� ����.
		AI_Output(self,other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02");	//� ���� ������� ���� �������, �� �� ������� ��!
	};
	DRAX_LEHRER_FREI = TRUE;
	Log_CreateTopic(GE_TEACHEROW,LOG_NOTE);
	b_logentry(GE_TEACHEROW,"��� ����� ��������� ��� ��������� ����������� ������, ���� ��� ��� ����� �� �������. ������ �� �������� ����� ������ ������� � ������ ������.");
};


instance ORG_819_DRAX_CREATURES(C_INFO)
{
	npc = org_819_drax;
	nr = 1;
	condition = org_819_drax_creatures_condition;
	information = org_819_drax_creatures_info;
	permanent = 1;
	description = "�� ������ ������� ���� ��������� ����������� ������?";
};


func int org_819_drax_creatures_condition()
{
	if((DRAX_LEHRER_FREI == TRUE) && ((KNOWS_GETTEETH == FALSE) || (KNOWS_GETFUR == FALSE) || (KNOWS_GETCLAWS == FALSE) || (KNOWS_GETHIDE == FALSE)))
	{
		return 1;
	};
};

func void org_819_drax_creatures_info()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_15_00");	//�� ������ ������� ���� ��������� ����������� ������?
	if((KNOWS_GETTEETH == FALSE) || (KNOWS_GETFUR == FALSE) || (KNOWS_GETCLAWS == FALSE) || (KNOWS_GETHIDE == FALSE))
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_06_01");	//�������, ����, �� �� ���� ��� �� ����� �� �����������.
		AI_Output(self,other,"Org_819_Drax_Creatures_06_02");	//� ������� ����� ����� �������� �����, ����� � �����, ���� �����, ��� ��� ��������. �� �� ��� ������ �������� ���������.
		AI_Output(self,other,"Org_819_Drax_Creatures_06_03");	//��������� ������ ������ ������ �������.
		Info_ClearChoices(org_819_drax_creatures);
		Info_AddChoice(org_819_drax_creatures,DIALOG_BACK,org_819_drax_creatures_back);
		Info_AddChoice(org_819_drax_creatures,"�� ������� ������� �����.",org_819_drax_creatures_prettymuch);
		if(KNOWS_GETTEETH == FALSE)
		{
			Info_AddChoice(org_819_drax_creatures,"������ ������ (����: 1 ���� ��������, 50 ������ ����)",org_819_drax_creatures_zahn);
		};
		if(KNOWS_GETFUR == FALSE)
		{
			Info_AddChoice(org_819_drax_creatures,"������ ���� (����: 1 ���� ��������, 100 ������ ����)",org_819_drax_creatures_fell);
		};
		if(KNOWS_GETCLAWS == FALSE)
		{
			Info_AddChoice(org_819_drax_creatures,"������ ������ (����: 1 ���� ��������, 50 ������ ����)",org_819_drax_creatures_kralle);
		};
		if(KNOWS_GETHIDE == FALSE)
		{
			Info_AddChoice(org_819_drax_creatures,"����� �������� (����: 1 ���� ��������, 100 ������ ����)",org_819_drax_creatures_haut);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_TaughtAll_06_00");	//��, ���, ������ � ������ ���� �����, ��� ���� ���.
	};
};

func void org_819_drax_creatures_back()
{
	Info_ClearChoices(org_819_drax_creatures);
};

func void org_819_drax_creatures_prettymuch()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_PrettyMuch_15_00");	//�� ������� ������� �����.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_01");	//�������, ���� ����� - ������� ������ ���������� ����.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_02");	//���� �� �� ������, ��� ��������� ����������� ������, �� ��� ������ ����� ����� ������ ������ ��� ������.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_03");	//� �� �������� ����������� ���������� �������, ������ �� �����.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_04");	//�� ����� ����� � ���������� �� ��������� ��������� ��� ����� �������.
};

func void org_819_drax_creatures_zahn()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_Zahn_15_00");	//��� �������� �����?
	if(Npc_HasItems(other,itminugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			b_giveinvitems(other,self,itminugget,50);
			PrintScreen("�����: ������ ������",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_819_Drax_Creatures_Zahn_06_01");	//�� ������ ������� �� ���, ����� ����� �� ���������. ����� ����� ��������, ��������� ����� ������ ���, ��� �����.
			AI_Output(self,other,"Org_819_Drax_Creatures_Zahn_06_02");	//����� ������, ������� � ���������� ������� ���� �����.
			KNOWS_GETTEETH = TRUE;
			Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
			b_logentry(GE_ANIMALTROPHIES,"����� ������ ������: ����, ������ ������, �����, ����, ���-��������, ��������.");
		}
		else
		{
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_00");	//�� ������ ��������� �����, ����� �� ������ �� ������� ���������.
			PrintScreen("������������ ����� ��������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00");	//� ���� ��� ����. ��� � ��� ������, ����� ��� ����� ���� ����.
	};
};

func void org_819_drax_creatures_fell()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_Fell_15_00");	//��� ������� �����?
	if(Npc_HasItems(other,itminugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			b_giveinvitems(other,self,itminugget,100);
			PrintScreen("�����: ������ ����",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_819_Drax_Creatures_Fell_06_01");	//����� �����, ��� �������� ����������� ���� ������� � ������. ����� ����� ������ �������, ������� ������� �� ��������� �� ��� ������.
			AI_Output(self,other,"Org_819_Drax_Creatures_Fell_06_02");	//�� ���� ������ � ���������� ���� ������� ������. � ��������� � ���� ������ ������ ������������, ������� �� ��� ���� ����� �� ������ ��� ���.
			KNOWS_GETFUR = TRUE;
			Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
			b_logentry(GE_ANIMALTROPHIES,"����� ������ ����: ����, ������ ������, ��������, ������.");
		}
		else
		{
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_01");	//������ ����� ������������, ����� ��������������� ���� �������.
			PrintScreen("������������ ����� ��������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01");	//� ���� ��� ����. ��� � ��� ������, ����� ��� ����� ���� ����.
	};
};

func void org_819_drax_creatures_kralle()
{
	if(Npc_HasItems(other,itminugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			b_giveinvitems(other,self,itminugget,50);
			PrintScreen("�����: ������ ������",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_819_Drax_Creatures_Kralle_15_00");	//����� ���� �������� �����.
			AI_Output(self,other,"Org_819_Drax_Creatures_Kralle_06_01");	//��� �����, ��� ������� �� ������ ������. ����� �������� ������ ������, �� ��� ���� �� �������� ��� ��������� � �� �������� �����.
			AI_Output(self,other,"Org_819_Drax_Creatures_Kralle_06_02");	//�������, ��������� ����� ����� ������ �� � ������� �����. ������ � ���� ���� ����� ������.
			KNOWS_GETCLAWS = TRUE;
			Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
			b_logentry(GE_ANIMALTROPHIES,"����� ������ ������: �������, �����, ����, ����, ����.");
		}
		else
		{
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_02");	//������ ����� ������������, ����� ��������������� ���� �������.
			PrintScreen("������������ ����� ��������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_02");	//� ���� ��� ����. ��� � ��� ������, ����� ��� ����� ���� ����.
	};
};

func void org_819_drax_creatures_haut()
{
	if(Npc_HasItems(other,itminugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			b_giveinvitems(other,self,itminugget,100);
			PrintScreen("�����: ������ ���� ��������",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_819_Drax_Creatures_Haut_15_00");	//��� ����� ������, ����� ������� ����� � ��������?
			AI_Output(self,other,"Org_819_Drax_Creatures_Haut_06_01");	//��� ����� �������� �� ��� ��������, � ���� ����� � ����������.
			AI_Output(self,other,"Org_819_Drax_Creatures_Haut_06_02");	//���� �� ��������� ����� �� �����, �� �� ������� ����� �� �����. ������ �� ������� ����� ����������� � ���� �������.
			KNOWS_GETHIDE = TRUE;
			Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
			b_logentry(GE_ANIMALTROPHIES,"����� ������ ���� ��������: ����, ���������.");
		}
		else
		{
			AI_Output(self,other,"Org_819_Drax_Creatures_KEINE_LP_06_03");	//�� ������ �������� ������ �����, ������ ��� ����-�� ������� � ����.
			PrintScreen("������������ ����� ��������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03");	//������� ������� ���. ��� ��������� - ����� ���� ����.
	};
};

