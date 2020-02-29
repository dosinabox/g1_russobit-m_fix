
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
	b_printtrademsg1("������� ������ ������ � ��� ���������.");
	CreateInvItem(self,grd_armor_l);
	CreateInvItems(self,itmw_1h_sword_03,1);
	b_giveinvitems(self,other,grd_armor_l,1);
	b_giveinvitems(self,other,itmw_1h_sword_03,1);
	AI_EquipArmor(hero,grd_armor_l);
	//AI_EquipBestMeleeWeapon(hero);
	b_logentry(GE_BECOMEGUARD,"� ������� � ������� ������ ��� ������ ������ ���������. � ���� ������ � ���� � ����� ������� �������, ���� � ���� ����� ���������� ����.");
	AI_StopProcessInfos(self);
};


var int stone_armor_m_was_bought;
var int stone_armor_h_was_bought;

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
	if(Npc_KnowsInfo(hero,grd_219_stone_getstuff) && (KAPITEL < 4) && (STONE_ARMOR_H_WAS_BOUGHT != 1) && (Npc_GetTrueGuild(hero) != GIL_KDF))
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
	if(STONE_ARMOR_H_WAS_BOUGHT != 1)
	{
		Info_AddChoice(grd_219_stone_betterarmor,b_buildbuyarmorstring("������� ������ ���������, ������: 70/10/25/0",VALUE_GRD_ARMOR_H),grd_219_stone_betterarmor_h);
	};
	if(STONE_ARMOR_M_WAS_BOUGHT != 1)
	{
		Info_AddChoice(grd_219_stone_betterarmor,b_buildbuyarmorstring("������ ���������, ������: 55/10/35/0",VALUE_GRD_ARMOR_M),grd_219_stone_betterarmor_m);
	};
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
		b_printtrademsg1("������ ����: 1650");
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_04");	//������, ��� �����. ���������� ��� ����, ���������, ������ �� �������� ��������� �� ��������!
		b_printtrademsg2("������� ������ ���������.");
		b_giveinvitems(hero,self,itminugget,VALUE_GRD_ARMOR_M);
		b_giveinvitems(self,hero,grd_armor_m,1);
		AI_EquipArmor(hero,grd_armor_m);
		STONE_ARMOR_M_WAS_BOUGHT = 1;
	};
	Info_ClearChoices(grd_219_stone_betterarmor);
};

func void grd_219_stone_betterarmor_h()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_H_15_01");	//��� ����� ������� ������� ���������.
	if(CAN_BUY_GRD_ARMOR_H == TRUE)
	{
		if(Npc_HasItems(hero,itminugget) < VALUE_GRD_ARMOR_H)
		{
			AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_03");	//���� � ���� ���� � ������, ��, ������, � ���� �� ������ �� ��� ����! ����� ���� - ����� �������!
		}
		else
		{
			b_printtrademsg1("������ ����: 3000");
			AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_04");	//������, ��� �����. ���������� ��� ����, ���������, ������ �� �������� ��������� �� ��������!
			b_printtrademsg2("������� ������� ������ ���������.");
			b_giveinvitems(hero,self,itminugget,VALUE_GRD_ARMOR_H);
			b_giveinvitems(self,hero,grd_armor_h,1);
			AI_EquipArmor(hero,grd_armor_h);
			STONE_ARMOR_H_WAS_BOUGHT = 1;
		};
	}
	else
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_H_06_02");	//����� ������� ������ ��� ������� ����������. � ��, ������, �� ��� �� �����.
	};
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
	AI_Output(self,other,"Info_EXIT_06_03");	//��������.
	AI_StopProcessInfos(self);
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
	AI_SetWalkMode(self,NPC_RUN);
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
	if(Npc_KnowsInfo(hero,dia_grd_219_stone1) && (Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_STABLE_LEFT_FRONT") || Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_STABLE_TO_CORRIDOR")))
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
	b_printtrademsg1("����� �������� ������.");
	var C_ITEM stonearmor;
	stonearmor = Npc_GetEquippedArmor(hero);
	if(Hlp_GetInstanceID(stonearmor) == Hlp_GetInstanceID(ore_armor_m))
	{
		AI_UnequipArmor(hero);
	};
	AI_Wait(self,1);
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
	b_printtrademsg2("������� ���������� �������� ������.");
	AI_EquipArmor(hero,ore_armor_h);
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
	b_printtrademsg1("������� �������� ��������.");
	CreateInvItem(self,stone_hpring);
	b_giveinvitems(self,other,stone_hpring,1);
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
	b_printtrademsg1("������� �������� ������.");
	CreateInvItem(self,stone_defring);
	b_giveinvitems(self,other,stone_defring,1);
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
	b_printtrademsg1("������� �������� �����.");
	CreateInvItem(self,stone_amulet);
	b_giveinvitems(self,other,stone_amulet,1);
	KNOWSTONE = 1;
};

instance STONE_HPRING(C_ITEM)
{
	name = "�������� ��������";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 500;
	visual = "ItMi_Ring_Stone_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_stone_hpring;
	on_unequip = unequip_stone_hpring;
	description = "�������� ��������";
	text[2] = NAME_BONUS_HPMAX;
	count[2] = 30;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_stone_hpring()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 30;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 30;
};

func void unequip_stone_hpring()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 30;
	if(self.attribute[ATR_HITPOINTS] > 31)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 30;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};

instance STONE_DEFRING(C_ITEM)
{
	name = "�������� ������";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 1500;
	visual = "ItMi_Ring_Stone_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_stone_defring;
	on_unequip = unequip_stone_defring;
	description = "�������� ������";
	text[1] = NAME_PROT_MAGIC;
	count[1] = 5;
	text[2] = NAME_PROT_FIRE;
	count[2] = 10;
	text[3] = NAME_PROT_POINT;
	count[3] = 15;
	text[4] = NAME_PROT_EDGE;
	count[4] = 15;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_stone_defring()
{
	self.protection[PROT_EDGE] += 15;
	self.protection[PROT_BLUNT] += 15;
	self.protection[PROT_POINT] += 15;
	self.protection[PROT_FIRE] += 10;
	self.protection[PROT_MAGIC] += 5;
};

func void unequip_stone_defring()
{
	self.protection[PROT_EDGE] -= 15;
	self.protection[PROT_BLUNT] -= 15;
	self.protection[PROT_POINT] -= 15;
	self.protection[PROT_FIRE] -= 10;
	self.protection[PROT_MAGIC] -= 5;
};

instance STONE_AMULET(C_ITEM)
{
	name = "�������� �����";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ItMi_Amulet_Stone.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_stone_amulet;
	on_unequip = unequip_stone_amulet;
	description = "�������� �����";
	text[2] = NAME_BONUS_MANAMAX;
	count[2] = 30;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_stone_amulet()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 30;
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 30;
};

func void unequip_stone_amulet()
{
	if(self.attribute[ATR_MANA] >= 30)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 30;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 30;
};


