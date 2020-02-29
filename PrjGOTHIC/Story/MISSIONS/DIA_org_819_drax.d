
func void b_draxlearn()
{
	if((KNOWS_GETTEETH == FALSE) || (KNOWS_GETFUR == FALSE) || (KNOWS_GETCLAWS == FALSE) || (KNOWS_GETHIDE == FALSE))
	{
		Info_ClearChoices(org_819_drax_learn);
		Info_AddChoice(org_819_drax_learn,DIALOG_BACK,org_819_drax_learn_back);
		if(KNOWS_GETTEETH == FALSE)
		{
			if(DIFF_HARD == TRUE)
			{
				Info_AddChoice(org_819_drax_learn,"������ ������ (2 ���� ��������, 50 ����)",org_819_drax_creatures_zahn);
			}
			else
			{
				Info_AddChoice(org_819_drax_learn,"������ ������ (1 ���� ��������, 50 ����)",org_819_drax_creatures_zahn);
			};
		};
		if(KNOWS_GETFUR == FALSE)
		{
			if(DIFF_HARD == TRUE)
			{
				Info_AddChoice(org_819_drax_learn,"������ ���� (2 ���� ��������, 100 ����)",org_819_drax_creatures_fell);
			}
			else
			{
				Info_AddChoice(org_819_drax_learn,"������ ���� (1 ���� ��������, 100 ����)",org_819_drax_creatures_fell);
			};
		};
		if(KNOWS_GETCLAWS == FALSE)
		{
			if(DIFF_HARD == TRUE)
			{
				Info_AddChoice(org_819_drax_learn,"������ ������ (2 ���� ��������, 50 ����)",org_819_drax_creatures_kralle);
			}
			else
			{
				Info_AddChoice(org_819_drax_learn,"������ ������ (1 ���� ��������, 50 ����)",org_819_drax_creatures_kralle);
			};
		};
		if(KNOWS_GETHIDE == FALSE)
		{
			if(DIFF_HARD == TRUE)
			{
				Info_AddChoice(org_819_drax_learn,"������ ���� �������� (2 ���� ��������, 100 ����)",org_819_drax_creatures_haut);
			}
			else
			{
				Info_AddChoice(org_819_drax_learn,"������ ���� �������� (1 ���� ��������, 100 ����)",org_819_drax_creatures_haut);
			};
		};
	}
	else
	{
		AI_Output(self,other,"SVM_6_NoLearnOverMax");	//�� ������ ���, ��� �����. ���� ����� ��������� ����-������ ���.
		DRAX_CAN_LEARN = FALSE;
	};
};

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
	if(!Npc_HasItems(other,itfobeer))
	{
		AI_Output(other,self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00");	//� ���� ��� ����.
		AI_Output(self,other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01");	//��� ���� ���. ��� ��� ��������� ���������� ����� �� �������. � ����� ��������� � �����, �������� ������� ����.
		AI_Output(self,other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02");	//� ���� ������� ���� �������, �� �� ������� ��!
	};
};

var int drax_lehrer_frei;

instance ORG_819_DRAX_SCAVENGER(C_INFO)
{
	npc = org_819_drax;
	nr = 1;
	condition = org_819_drax_scavenger_condition;
	information = org_819_drax_scavenger_info;
	permanent = 0;
	description = "��� ���� ����. ��� �� ���������� ��� �� �����?";
};


func int org_819_drax_scavenger_condition()
{
	if(Npc_KnowsInfo(hero,org_819_drax_hunthere) && Npc_HasItems(other,itfobeer) > 0)
	{
		return 1;
	};
};

func void org_819_drax_scavenger_info()
{
	b_giveinvitems(other,self,itfobeer,1);
	b_printtrademsg1("������ ����.");
	AI_Output(other,self,"Org_819_Drax_Scavenger_15_00");	//��� ���� ����. ��� �� ���������� ��� �� �����?
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_UseItem(self,itfobeer);
	AI_Output(self,other,"Org_819_Drax_Scavenger_06_01");	//��� ����� �������� �������� �������. �� �������� �� ������������. ��������� �� ����� ����������. �������� ���������� �� ���� ����� ��������.
	AI_Output(self,other,"Org_819_Drax_Scavenger_06_02");	//����� �� ��������� �����, ����� �������������, � ����� ������������ �������� �� ����. ����� ������ ��������.
	AI_Output(self,other,"Org_819_Drax_Scavenger_06_03");	//������ ���� ������. ��������� �����������, � � ���� ����� ����������� ������������. ����� �� � ��������� ��� ��������.
	AI_Output(self,other,"Org_819_Drax_Scavenger_06_04");	//��, � ���� �� ������ ���� ������, �����... �� ����� ����� �� ���������.
	DRAX_LEHRER_FREI = TRUE;
};


instance ORG_819_DRAX_CREATURES(C_INFO)
{
	npc = org_819_drax;
	nr = 1;
	condition = org_819_drax_creatures_condition;
	information = org_819_drax_creatures_info;
	permanent = 0;
	description = "�� ������ ������� ���� ��������� ����������� ������?";
};

func int org_819_drax_creatures_condition()
{
	if(DRAX_LEHRER_FREI == TRUE)
	{
		return 1;
	};
};

func void org_819_drax_creatures_info()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_15_00");	//�� ������ ������� ���� ��������� ����������� ������?
	AI_Output(self,other,"Org_819_Drax_Creatures_06_01");	//�������, ����, �� �� ���� ��� �� ����� �� �����������.
	AI_Output(self,other,"Org_819_Drax_Creatures_06_02");	//� ������� ����� ����� �������� �����, ����� � �����, ���� �����, ��� ��� ��������. �� �� ��� ������ �������� ���������.
	AI_Output(self,other,"Org_819_Drax_Creatures_06_03");	//��������� ������ ������ ������ �������.
	DRAX_CAN_LEARN = TRUE;
	if((KNOWS_GETTEETH == FALSE) || (KNOWS_GETFUR == FALSE) || (KNOWS_GETCLAWS == FALSE) || (KNOWS_GETHIDE == FALSE))
	{
		Log_CreateTopic(GE_TEACHEROW,LOG_NOTE);
		b_logentry(GE_TEACHEROW,"��� ����� ��������� ��� ��������� ����������� ������, ���� ��� ��� ����� �� �������. ������ �� �������� ����� ������ ������� � ������ ������.");
	};
};

instance ORG_819_DRAX_TOOMUCH(C_INFO)
{
	npc = org_819_drax;
	nr = 1;
	condition = org_819_drax_toomuch_condition;
	information = org_819_drax_toomuch_info;
	permanent = 0;
	description = "�� ������� ������� �����.";
};

func int org_819_drax_toomuch_condition()
{
	if(DRAX_CAN_LEARN == TRUE)
	{
		return 1;
	};
};

func void org_819_drax_toomuch_info()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_PrettyMuch_15_00");	//�� ������� ������� �����.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_01");	//�������, ���� ����� - ������� ������ ���������� ����.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_02");	//���� �� �� ������, ��� ��������� ����������� ������, �� ��� ������ ����� ����� ������ ������ ��� ������.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_03");	//� �� �������� ����������� ���������� �������, ������ �� �����.
	AI_Output(self,other,"Org_819_Drax_Creatures_PrettyMuch_06_04");	//�� ����� ����� � ���������� �� ��������� ��������� ��� ����� �������.
};

instance ORG_819_DRAX_LEARN(C_INFO)
{
	npc = org_819_drax;
	nr = 990;
	condition = org_819_drax_learn_condition;
	information = org_819_drax_learn_info;
	permanent = 1;
	description = DIALOG_LEARN;
};

func int org_819_drax_learn_condition()
{
	if(DRAX_CAN_LEARN == TRUE)
	{
		return 1;
	};
};

func void org_819_drax_learn_info()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_15_00");	//� ���� ��������� ��������� ����������� ������.
	if((KNOWS_GETTEETH == FALSE) || (KNOWS_GETFUR == FALSE) || (KNOWS_GETCLAWS == FALSE) || (KNOWS_GETHIDE == FALSE))
	{
		AI_Output(self,other,"SVM_6_WhatDoYouWant");	//� ���� ������ ����?
	};
	b_draxlearn();
};

func void org_819_drax_learn_back()
{
	Info_ClearChoices(org_819_drax_learn);
};

func void org_819_drax_creatures_zahn()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_Zahn_15_00");	//��� �������� �����?
	if(Npc_HasItems(other,itminugget) >= 50)
	{
		if(((DIFF_HARD == TRUE) && (other.lp >= 2)) || ((DIFF_HARD == FALSE) && (other.lp >= 1)))
		{
			b_printtrademsg1("������ ����: 50");
			if(DIFF_HARD == TRUE)
			{
				other.lp = other.lp - 2;
			}
			else
			{
				other.lp = other.lp - 1;
			};
			b_giveinvitems(other,self,itminugget,50);
			PrintScreen("�����: ������ ������",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_819_Drax_Creatures_Zahn_06_01");	//�� ������ ������� �� ���, ����� ����� �� ���������. ����� ����� ��������, ��������� ����� ������ ���, ��� �����.
			AI_Output(self,other,"Org_819_Drax_Creatures_Zahn_06_02");	//����� ������, ������� � ���������� ������� ���� �����.
			KNOWS_GETTEETH = TRUE;
			Log_CreateTopic(GE_ANIMALTROPHIES,LOG_NOTE);
			b_logentry(GE_ANIMALTROPHIES,"����� ������ ������: ����, ������ ������, �����, ����, ������, ��������.");
			
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
	if((KNOWS_GETTEETH == TRUE) && (KNOWS_GETFUR == TRUE) && (KNOWS_GETCLAWS == TRUE) && (KNOWS_GETHIDE == TRUE))
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_TaughtAll_06_00");	//��, ���, ������ � ������ ���� �����, ��� ���� ���.
		Info_ClearChoices(org_819_drax_learn);
		DRAX_CAN_LEARN = FALSE;
	}
	else
	{
		b_draxlearn();
	};
};

func void org_819_drax_creatures_fell()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_Fell_15_00");	//��� ������� �����?
	if(Npc_HasItems(other,itminugget) >= 100)
	{
		if(((DIFF_HARD == TRUE) && (other.lp >= 2)) || ((DIFF_HARD == FALSE) && (other.lp >= 1)))
		{
			b_printtrademsg1("������ ����: 100");
			if(DIFF_HARD == TRUE)
			{
				other.lp = other.lp - 2;
			}
			else
			{
				other.lp = other.lp - 1;
			};
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
			AI_Output(self,other,"SVM_6_NoLearnNoPoints");	//� ������ �� ����� ������� ����, ���� �� ������� �����.
			PrintScreen("������������ ����� ��������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01");	//� ���� ��� ����. ��� � ��� ������, ����� ��� ����� ���� ����.
	};
	if((KNOWS_GETTEETH == TRUE) && (KNOWS_GETFUR == TRUE) && (KNOWS_GETCLAWS == TRUE) && (KNOWS_GETHIDE == TRUE))
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_TaughtAll_06_00");	//��, ���, ������ � ������ ���� �����, ��� ���� ���.
		Info_ClearChoices(org_819_drax_learn);
		DRAX_CAN_LEARN = FALSE;
	}
	else
	{
		b_draxlearn();
	};
};

func void org_819_drax_creatures_kralle()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_Kralle_15_00");	//����� ���� �������� �����.
	if(Npc_HasItems(other,itminugget) >= 50)
	{
		if(((DIFF_HARD == TRUE) && (other.lp >= 2)) || ((DIFF_HARD == FALSE) && (other.lp >= 1)))
		{
			b_printtrademsg1("������ ����: 50");
			if(DIFF_HARD == TRUE)
			{
				other.lp = other.lp - 2;
			}
			else
			{
				other.lp = other.lp - 1;
			};
			b_giveinvitems(other,self,itminugget,50);
			PrintScreen("�����: ������ ������",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
		AI_Output(self,other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03");	//������� ������� ���. ��� ��������� - ����� ���� ����.
	};
	if((KNOWS_GETTEETH == TRUE) && (KNOWS_GETFUR == TRUE) && (KNOWS_GETCLAWS == TRUE) && (KNOWS_GETHIDE == TRUE))
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_TaughtAll_06_00");	//��, ���, ������ � ������ ���� �����, ��� ���� ���.
		Info_ClearChoices(org_819_drax_learn);
		DRAX_CAN_LEARN = FALSE;
	}
	else
	{
		b_draxlearn();
	};
};

func void org_819_drax_creatures_haut()
{
	AI_Output(other,self,"Org_819_Drax_Creatures_Haut_15_00");	//��� ����� ������, ����� ������� ����� � ��������?
	if(Npc_HasItems(other,itminugget) >= 100)
	{
		if(((DIFF_HARD == TRUE) && (other.lp >= 2)) || ((DIFF_HARD == FALSE) && (other.lp >= 1)))
		{
			b_printtrademsg1("������ ����: 100");
			if(DIFF_HARD == TRUE)
			{
				other.lp = other.lp - 2;
			}
			else
			{
				other.lp = other.lp - 1;
			};
			b_giveinvitems(other,self,itminugget,100);
			PrintScreen("�����: ������ ���� ��������",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
	if((KNOWS_GETTEETH == TRUE) && (KNOWS_GETFUR == TRUE) && (KNOWS_GETCLAWS == TRUE) && (KNOWS_GETHIDE == TRUE))
	{
		AI_Output(self,other,"Org_819_Drax_Creatures_TaughtAll_06_00");	//��, ���, ������ � ������ ���� �����, ��� ���� ���.
		Info_ClearChoices(org_819_drax_learn);
		DRAX_CAN_LEARN = FALSE;
	}
	else
	{
		b_draxlearn();
	};
};

