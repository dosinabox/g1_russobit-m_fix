
instance DIA_STONE_HELLO(C_INFO)
{
	npc = grd_219_stone;
	nr = 1;
	condition = dia_stone_hello_condition;
	information = dia_stone_hello_info;
	permanent = 0;
	description = "�� ���� ������?";
};


func int dia_stone_hello_condition()
{
	if(KAPITEL < 4)
	{
		return TRUE;
	};
};

func void dia_stone_hello_info()
{
	AI_Output(other,self,"DIA_Stone_Hello_15_00");	//�� ���� ������?
	AI_Output(self,other,"DIA_Stone_Hello_06_01");	//�����.
};


instance DIA_STONE_NOTSELLING(C_INFO)
{
	npc = grd_219_stone;
	nr = 1;
	condition = dia_stone_notselling_condition;
	information = dia_stone_notselling_info;
	permanent = 1;
	description = "�� �������� ������ � �������?";
};


func int dia_stone_notselling_condition()
{
	if((Npc_GetTrueGuild(hero) != GIL_GRD) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_stone_notselling_info()
{
	AI_Output(other,self,"DIA_Stone_NotSelling_15_00");	//�� �������� ������ � �������?
	AI_Output(self,other,"DIA_Stone_NotSelling_06_01");	//��, ������ �������. � ������� �������� ����.
	AI_Output(other,self,"DIA_Stone_NotSelling_15_02");	//� ����� � ���� ���� �������?
	AI_Output(self,other,"DIA_Stone_NotSelling_06_03");	//���� ������� ��� ����������. � �� �� ��������. ��� ���, ����� ���-������ ��� ���� � ������ �����!
	AI_StopProcessInfos(self);
};


instance GRD_219_STONE_GETSTUFF(C_INFO)
{
	npc = grd_219_stone;
	condition = grd_219_stone_getstuff_condition;
	information = grd_219_stone_getstuff_info;
	important = 0;
	permanent = 0;
	description = "��� ����� �������.";
};


func int grd_219_stone_getstuff_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void grd_219_stone_getstuff_info()
{
	AI_Output(other,self,"GRD_219_Stone_GETSTUFF_Info_15_01");	//��� ����� �������.
	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_02");	//����, ����� ���� ���� �� ������? ��� ������������!
	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_03");	//��� ���� �������� �������� ���� ������ �� ������. �������, ���-�� ����� ����?
	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_04");	//���, ����� ������� � ���. ����� ���������� � ���������!
	CreateInvItems(self,itmw_1h_sword_03,2);
	b_giveinvitems(self,other,itmw_1h_sword_03,2);
	Npc_RemoveInvItem(other,itmw_1h_sword_03);
	CreateInvItem(other,grd_armor_l);
	AI_EquipBestArmor(hero);
	AI_EquipBestMeleeWeapon(hero);
	b_logentry(GE_BECOMEGUARD,"� ������� � ������� ������ ��� ������ ������ ���������. � ���� ������ � ���� � ����� ������� �������, ���� � ���� ����� ���������� ����.");
	AI_StopProcessInfos(self);
};


instance GRD_219_STONE_BETTERARMOR(C_INFO)
{
	npc = grd_219_stone;
	condition = grd_219_stone_betterarmor_condition;
	information = grd_219_stone_betterarmor_info;
	important = 0;
	permanent = 1;
	description = "��� ����� ������� �������.";
};


func int grd_219_stone_betterarmor_condition()
{
	if(Npc_KnowsInfo(hero,grd_219_stone_getstuff) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void grd_219_stone_betterarmor_info()
{
	AI_Output(other,self,"GRD_219_Stone_BETTERARMOR_Info_15_01");	//��� ����� ������� �������.
	AI_Output(self,other,"GRD_219_Stone_BETTERARMOR_Info_06_02");	//����� ������ ������� �������, ����� � ��������... ��, �������, ���� � ���� ����� ���������� ����.
	Info_ClearChoices(grd_219_stone_betterarmor);
	Info_AddChoice(grd_219_stone_betterarmor,DIALOG_BACK,grd_219_stone_betterarmor_back);
	Info_AddChoice(grd_219_stone_betterarmor,b_buildbuyarmorstring("���. ������ ���������: ������ 70, ������ 10, ����� 25",VALUE_GRD_ARMOR_H),grd_219_stone_betterarmor_h);
	Info_AddChoice(grd_219_stone_betterarmor,b_buildbuyarmorstring("������ ���������: ������ 55, ������ 10, ����� 35",VALUE_GRD_ARMOR_M),grd_219_stone_betterarmor_m);
};

func void grd_219_stone_betterarmor_m()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_M_15_01");	//��� ����� ������� ������� ���������.
	if(KAPITEL < 3)
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_02");	//����� ������, ��� ������ ��������� �������, � ����� ��� � �������� ����� �������!
	}
	else if(Npc_HasItems(hero,itminugget) < VALUE_GRD_ARMOR_M)
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_03");	//���� � ���� ���� � ������, ��, ������, � ���� �� ������ �� ��� ����! ����� ���� - ����� �������!
	}
	else
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_04");	//������, ��� �����. ���������� ��� ����, ���������, ������ �� �������� ��������� �� ��������!
		b_giveinvitems(hero,self,itminugget,VALUE_GRD_ARMOR_M);
		b_giveinvitems(self,hero,grd_armor_m,1);
		AI_EquipBestArmor(hero);
	};
	Info_ClearChoices(grd_219_stone_betterarmor);
};

func void grd_219_stone_betterarmor_h()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_H_15_01");	//��� ����� ������� ������� ���������.
	AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_H_06_02");	//����� ������� ������ ��� ������� ����������. � ��, ������, �� ��� �� �����.
	Info_ClearChoices(grd_219_stone_betterarmor);
};

func void grd_219_stone_betterarmor_back()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_BACK_15_01");	//� ���������.  
	AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_BACK_06_02");	//���� ����. �� ������, ��� ���� �����.
	Info_ClearChoices(grd_219_stone_betterarmor);
};


instance DIA_GRD_219_STONE_EXIT(C_INFO)
{
	npc = grd_219_stone;
	nr = 999;
	condition = dia_grd_219_stone_exit_condition;
	information = dia_grd_219_stone_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_grd_219_stone_exit_condition()
{
	return 1;
};

func void dia_grd_219_stone_exit_info()
{
	var C_NPC stone;
	if(Npc_KnowsInfo(hero,dia_grd_219_stone4))
	{
		AI_StopProcessInfos(self);
		stone = Hlp_GetNpc(grd_219_stone);
		TA_BeginOverlay(stone);
		TA_Min(stone,0,0,0,5,zs_position,"OCC_MERCS_HALLWAY_BACK");
		TA_Min(stone,0,5,0,10,zs_position,"OCC_MERCS_ENTRANCE");
		TA_Min(stone,0,10,0,15,zs_position,"OCC_SHADOWS_CORNER");
		TA_Min(stone,0,15,0,20,zs_position,"OCC_STABLE_ENTRANCE");
		TA_Min(stone,0,20,72,0,zs_position,"OCC_STABLE_LEFT_FRONT");
		TA_EndOverlay(stone);
		AI_Output(self,other,"Info_EXIT_06_02");	//��� ��������.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"Info_EXIT_06_03");	//��������.
		AI_StopProcessInfos(self);
	};
};


instance DIA_GRD_219_STONE(C_INFO)
{
	npc = grd_219_stone;
	condition = dia_grd_219_stone_condition;
	information = dia_grd_219_stone_info;
	important = 1;
	permanent = 0;
};


func int dia_grd_219_stone_condition()
{
	if(KAPITEL >= 5)
	{
		return 1;
	};
};

func void dia_grd_219_stone_info()
{
	AI_Output(self,other,"DIA_GRD_219_Stone_06_01");	//���� ����? �� �� ����� �� ����������� ������.
};


instance DIA_GRD_219_STONE1(C_INFO)
{
	npc = grd_219_stone;
	condition = dia_grd_219_stone1_condition;
	information = dia_grd_219_stone1_info;
	important = 0;
	permanent = 0;
	description = "������, � �� ���� �� ��� �����.";
};


func int dia_grd_219_stone1_condition()
{
	if(Npc_KnowsInfo(hero,dia_grd_219_stone))
	{
		return 1;
	};
};

func void dia_grd_219_stone1_info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_01");	//������, � �� ���� �� ��� �����.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_02");	//����� ��� �� ���� �����? ����� �� ����� ����� ������ ��� ����...
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_03");	//������ ���, �� ��� ����� �� ���.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_04");	//������ �������, ��� �� ��� ������, ������� �������� ������ �� �����?
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_05");	//��, ��� �.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_06");	//������, ��� �� ������� �� �� �������! �� � ���, ��� ���� ������ ��������� �������-�� ������� ����!
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_07");	//�� ����� ���� ������� ����?
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_08");	//� �������, ��� ���� �������� �� �������, � ����� ������������ ��� �����������, ����� ��������� ������ � ���������� ����.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_09");	//��, �������...
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_10");	//... � ���� �������. ����� �������, ������ �� ��� � �������, ���������.
	Npc_ExchangeRoutine(self,"OTNEW");
};


instance DIA_GRD_219_STONE3(C_INFO)
{
	npc = grd_219_stone;
	condition = dia_grd_219_stone3_condition;
	information = dia_grd_219_stone3_info;
	important = 1;
	permanent = 0;
};


func int dia_grd_219_stone3_condition()
{
	if(Npc_KnowsInfo(hero,dia_grd_219_stone1) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_STABLE_LEFT_FRONT"))
	{
		return 1;
	};
};

func void dia_grd_219_stone3_info()
{
	AI_Output(self,other,"DIA_GRD_219_Stone3_06_01");	//� ��� � ��. ��� ��� ���� ������������� �� ��, ��� �� ���� ������� �� ��� �������� ����!
	AI_Output(self,other,"DIA_GRD_219_Stone3_06_02");	//������, � ��� �������: ��� ���� ������ ���� ��������, �����, � ���� ��� ���� ���-������, �?
	AI_Output(self,other,"DIA_GRD_219_Stone3_06_03");	//�����, ������ ��� ���-�� � ���� ����...
};


instance DIA_GRD_219_STONE2(C_INFO)
{
	npc = grd_219_stone;
	condition = dia_grd_219_stone2_condition;
	information = dia_grd_219_stone2_info;
	important = 0;
	permanent = 0;
	description = "��� ������� ���� �� �������? ��� �� ����� ��������?";
};


func int dia_grd_219_stone2_condition()
{
	if(Npc_KnowsInfo(hero,dia_grd_219_stone3))
	{
		return 1;
	};
};

func void dia_grd_219_stone2_info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone2_15_01");	//��� ������� ���� �� �������? ��� �� ����� ��������?
	AI_Output(self,other,"DIA_GRD_219_Stone2_06_02");	//�����! ��� ������ �������� ���� � ������� � ������ ����. � ��� �� ��� ���, ������ ������, ��� ������ ������ �� ���� ������ ������.
	AI_Output(self,other,"DIA_GRD_219_Stone2_06_03");	//���� ������� � ��� �������� ���� � ���������, ������ ����� ����� ���� ���������� �� ������.
};


instance DIA_GRD_219_STONE4(C_INFO)
{
	npc = grd_219_stone;
	condition = dia_grd_219_stone4_condition;
	information = dia_grd_219_stone4_info;
	important = 0;
	permanent = 0;
	description = "�� ������ ������� ��� �������� �������?";
};


func int dia_grd_219_stone4_condition()
{
	if(Npc_KnowsInfo(hero,dia_grd_219_stone3) && Npc_HasItems(hero,ore_armor_m) && (KNOWSTONE == 0))
	{
		return 1;
	};
};

func void dia_grd_219_stone4_info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone4_15_01");	//�� ������ ������� ��� �������� �������?
	AI_Output(self,other,"DIA_GRD_219_Stone4_06_02");	//�������, ����. ����� ����, ������� � ��� ����� ������.
	AI_UnequipArmor(hero);
	b_giveinvitems(hero,self,ore_armor_m,1);
	Npc_RemoveInvItem(self,ore_armor_m);
	b_startusemob(self,"BSFIRE");
	AI_Wait(self,1);
	b_stopusemob(self,"BSFIRE");
	AI_Wait(self,1);
	b_startusemob(self,"BSANVIL");
	AI_Wait(self,1);
	b_stopusemob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	CreateInvItem(self,ore_armor_h);
	b_giveinvitems(self,hero,ore_armor_h,1);
	AI_Output(self,other,"DIA_GRD_219_Stone4_06_03");	//�����, ������ ��� ������� ������ � �� � �������.
	KNOWSTONE = 1;
};


instance DIA_GRD_219_STONE5(C_INFO)
{
	npc = grd_219_stone;
	condition = dia_grd_219_stone5_condition;
	information = dia_grd_219_stone5_info;
	important = 0;
	permanent = 0;
	description = "� ����� �� �������� ������, ����� �������� ��� ��������� �������.";
};


func int dia_grd_219_stone5_condition()
{
	if(Npc_KnowsInfo(hero,dia_grd_219_stone3) && (KNOWSTONE == 0))
	{
		return 1;
	};
};

func void dia_grd_219_stone5_info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone5_15_01");	//� ����� �� �������� ������, ������� ����� �������� ��� ��������� �������.
	AI_Output(self,other,"DIA_GRD_219_Stone5_06_02");	//��� ������. ������.
	b_startusemob(self,"BSFIRE");
	AI_Wait(self,1);
	b_stopusemob(self,"BSFIRE");
	AI_Wait(self,1);
	b_startusemob(self,"BSANVIL");
	AI_Wait(self,1);
	b_stopusemob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_GRD_219_Stone5_06_03");	//������ �������� ���� ���� �������������� ����� ��������� ���. �����, ������ �� � �������.
	CreateInvItem(self,ring_des_lebens2);
	b_giveinvitems(self,other,ring_des_lebens2,1);
	KNOWSTONE = 1;
};


instance DIA_GRD_219_STONE6(C_INFO)
{
	npc = grd_219_stone;
	condition = dia_grd_219_stone6_condition;
	information = dia_grd_219_stone6_info;
	important = 0;
	permanent = 0;
	description = "��������, ��� ����������� �� ������ ������.";
};


func int dia_grd_219_stone6_condition()
{
	if(Npc_KnowsInfo(hero,dia_grd_219_stone3) && (KNOWSTONE == 0))
	{
		return 1;
	};
};

func void dia_grd_219_stone6_info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone6_15_01");	//��������, ��� ����������� �� ������ ������.
	AI_Output(self,other,"DIA_GRD_219_Stone6_06_02");	//������ ������? ������, ����� ������ � ������. ������� �������.
	b_startusemob(self,"BSFIRE");
	AI_Wait(self,1);
	b_stopusemob(self,"BSFIRE");
	AI_Wait(self,1);
	b_startusemob(self,"BSANVIL");
	AI_Wait(self,1);
	b_stopusemob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_GRD_219_Stone6_06_03");	//����� ������ ������ - �������. ��� ��� ������ �� � �������.
	CreateInvItem(self,schutzring_total2);
	b_giveinvitems(self,other,schutzring_total2,1);
	KNOWSTONE = 1;
};


instance DIA_GRD_219_STONE7(C_INFO)
{
	npc = grd_219_stone;
	condition = dia_grd_219_stone7_condition;
	information = dia_grd_219_stone7_info;
	important = 0;
	permanent = 0;
	description = "������ ��� ��, ��� ������� ��� ���������� ����.";
};


func int dia_grd_219_stone7_condition()
{
	if(Npc_KnowsInfo(hero,dia_grd_219_stone3) && (KNOWSTONE == 0))
	{
		return 1;
	};
};

func void dia_grd_219_stone7_info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone7_15_01");	//������ ��� ��, ��� ������� ��� ���������� ����.
	AI_Output(self,other,"DIA_GRD_219_Stone7_06_02");	//...�������� ���������� ����?.. ������! �����, � ���� ���� ������ �����. ������� �������.
	b_startusemob(self,"BSFIRE");
	AI_Wait(self,1);
	b_stopusemob(self,"BSFIRE");
	AI_Wait(self,1);
	b_startusemob(self,"BSANVIL");
	AI_Wait(self,1);
	b_stopusemob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_GRD_219_Stone7_06_03");	//���, ������ �����. �������� ���� ����������, �����, �� � ����� �� �������.
	CreateInvItem(self,amulett_der_magie);
	b_giveinvitems(self,other,amulett_der_magie,1);
	KNOWSTONE = 1;
};

