
instance INFO_XARDAS_EXIT(C_INFO)
{
	npc = kdf_404_xardas;
	nr = 999;
	condition = info_xardas_exit_condition;
	information = info_xardas_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_xardas_exit_condition()
{
	return 1;
};

func void info_xardas_exit_info()
{
	if(Npc_HasItems(self,demourizel))
	{
		Npc_RemoveInvItem(self,demourizel);
	};
	AI_StopProcessInfos(self);
};


instance INFO_XARDAS_DISTURB(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_disturb_condition;
	information = info_xardas_disturb_info;
	important = 1;
	permanent = 0;
};


func int info_xardas_disturb_condition()
{
	if(!URSHAK_SPOKEOFULUMULU)
	{
		return TRUE;
	};
};

func void info_xardas_disturb_info()
{
	b_whirlaround(self,hero);
	AI_Output(self,hero,"Info_Xardas_DISTURB_14_01");	//��� ����� ��������� ���� �� ���� ������������?
	AI_Output(hero,self,"Info_Xardas_DISTURB_15_02");	//���� �����...
	AI_Output(self,hero,"Info_Xardas_DISTURB_14_03");	//�������, ��� ���� �����. � �� ����� ����� �����.
	AI_Output(self,hero,"Info_Xardas_DISTURB_14_04");	//������� ������ ��, ��� �� ��� ��� ����� ����� �� ���� ��������� ������� ����� ������. � �� ��� ������.
	//Npc_ExchangeRoutine(self,"study");
};


instance INFO_XARDAS_OTHERS(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_others_condition;
	information = info_xardas_others_info;
	important = 0;
	permanent = 0;
	description = "��� � ���� ��������� � ������?";
};


func int info_xardas_others_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_disturb))
	{
		return TRUE;
	};
};

func void info_xardas_others_info()
{
	AI_Output(hero,self,"Info_Xardas_OTHERS_15_01");	//��� � ���� ��������� � ������?
	AI_Output(self,hero,"Info_Xardas_OTHERS_14_02");	//��, �� �� ���� ����. ����� ��� ��� ���������, � �������� �� � ����� �� ���� ��������.
	AI_Output(hero,self,"Info_Xardas_OTHERS_15_03");	//��, �� ������ ������ ���� ���������.
};


instance INFO_XARDAS_SATURAS(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_saturas_condition;
	information = info_xardas_saturas_info;
	important = 0;
	permanent = 0;
	description = "���� ������� �������. ��� ����� ���� ������!";
};


func int info_xardas_saturas_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_disturb))
	{
		return TRUE;
	};
};

func void info_xardas_saturas_info()
{
	AI_Output(hero,self,"Info_Xardas_SATURAS_15_01");	//���� ������� �������. ��� ����� ���� ������!
	AI_Output(hero,self,"Info_Xardas_SATURAS_15_02");	//� ����� ���� ���� ������ ����, � ���...
	AI_Output(self,hero,"Info_Xardas_SATURAS_14_03");	//���� ���� �� ����� �� �������!
	AI_Output(hero,self,"Info_Xardas_SATURAS_15_04");	//�� �������?
	AI_Output(self,hero,"Info_Xardas_SATURAS_14_05");	//���!
};


instance INFO_XARDAS_KDW(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_kdw_condition;
	information = info_xardas_kdw_info;
	important = 0;
	permanent = 0;
	description = "��� ���� ����� ���� ������!";
};


func int info_xardas_kdw_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_disturb))
	{
		return TRUE;
	};
};

func void info_xardas_kdw_info()
{
	AI_Output(hero,self,"Info_Xardas_KDW_15_01");	//��� ���� ����� ���� ������!
	AI_Output(hero,self,"Info_Xardas_KDW_15_02");	//����� �� ������� ������.
	AI_Output(self,hero,"Info_Xardas_KDW_14_03");	//�������������. � ���� � ������ ������, ��� ���� �������������� �������� �� �����, �������� ��������� �����, ������ ���� ��������.
	AI_Output(self,hero,"Info_Xardas_KDW_14_04");	//�������� � ������ ���� ���� ���������� ���� ������, ����� �������� ������ ��������� ������.
};


instance INFO_XARDAS_SLEEPER(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_sleeper_condition;
	information = info_xardas_sleeper_info;
	important = 0;
	permanent = 0;
	description = "���, ���� �������� ������, �� ����� ���� ���� �����.";
};


func int info_xardas_sleeper_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_disturb))
	{
		return TRUE;
	};
};

func void info_xardas_sleeper_info()
{
	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_01");	//���, ���� �������� ������, �� ����� ���� ���� �����.
	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_02");	//�� ���� ������ ���� �� ��������� ��������.
	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_03");	//���� ���� ������ �������, ��� ��� ������� ��������� � ���������.
	AI_Output(self,hero,"Info_Xardas_SLEEPER_14_04");	//��� ��� ����� ������, �� ����� �� ���� ������� ���� �� ������������, ��� ��� ������ � ������.
};


instance INFO_XARDAS_DANGER(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_danger_condition;
	information = info_xardas_danger_info;
	important = 0;
	permanent = 0;
	description = "���� ����� ������ ���� �� ������ ������������� ��� ���������...";
};


func int info_xardas_danger_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_sleeper) && Npc_KnowsInfo(hero,info_xardas_saturas))
	{
		return TRUE;
	};
};

func void info_xardas_danger_info()
{
	AI_Output(hero,self,"Info_Xardas_DANGER_15_01");	//���� ����� ������ ���� �� ������ ������������� ��� ���������...
	AI_Output(self,hero,"Info_Xardas_DANGER_14_02");	//... ������ �� ���� ���������� ����! ������� �� ������ ������� �� ������, ����� ��������� ������.
	AI_Output(self,hero,"Info_Xardas_DANGER_14_03");	//���� �� �������� � ������� ��������� ���� ����� �� �������� �������, � �� �� ���� ��������� �����, ��� �� ������ ����� ��, ��� ���� �.
	AI_Output(hero,self,"Info_Xardas_DANGER_15_04");	//� ��� �� ������?
	AI_Output(self,hero,"Info_Xardas_DANGER_14_05");	//�� ������� �������� ������� �� ���� �� ���������� ���������� ����� �� ���������� ������ ���� ������, ������ ������ ������ ����� �������� ��������.
};


instance INFO_XARDAS_BARRIER(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_barrier_condition;
	information = info_xardas_barrier_info;
	important = 0;
	permanent = 0;
	description = "�� ���� ������� ����� �� ���� �����?";
};


func int info_xardas_barrier_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_danger))
	{
		return TRUE;
	};
};

func void info_xardas_barrier_info()
{
	AI_Output(hero,self,"Info_Xardas_BARRIER_15_01");	//�� ���� ������� ����� �� ���� �����?
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_02");	//��� �, ���� ����� ������� � ������������: ����� ����� ������ ��� ������� �����.
	AI_Output(hero,self,"Info_Xardas_BARRIER_15_03");	//��� ������� �����?
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_04");	//���� �� �������� � ������� ������. � ��� ���� ���� ��������, � �� ��������� ��� ����� ���������� � ������������.
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_05");	//����� ��� ����� ���� �����-������� �������� ��������������� ������, ����� �� ������ �� ������� �������� ������.
	AI_Output(hero,self,"Info_Xardas_BARRIER_15_06");	//� ������ - ��� ����� ������?
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_07");	//��� ��� ���� ���� ��� ������ ������� �����. �� ����� ��� ��� ������� � ������ ��� ���������� ����� ����� ����� ���, � �� ����.
};


instance INFO_XARDAS_EVENT(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_event_condition;
	information = info_xardas_event_info;
	important = 0;
	permanent = 0;
	description = "�� � ������ ����� �� ������?";
};


func int info_xardas_event_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_barrier))
	{
		return TRUE;
	};
};

func void info_xardas_event_info()
{
	AI_Output(hero,self,"Info_Xardas_EVENT_15_01");	//�� � ������ ����� �� ������?
	AI_Output(self,hero,"Info_Xardas_EVENT_14_02");	//��� �������, ��� �� �������... ���, � ���� ��� � ���� ���������, ������� ��� ���� ���� �������.
	AI_Output(hero,self,"Info_Xardas_EVENT_15_03");	//����� �������?
	AI_Output(self,hero,"Info_Xardas_EVENT_14_04");	//������ ����: ���� �� ������� ��� ������ �� ������ �����.
};


instance INFO_XARDAS_EVENTWHY(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_eventwhy_condition;
	information = info_xardas_eventwhy_info;
	important = 0;
	permanent = 0;
	description = "�� ��� ������?";
};


func int info_xardas_eventwhy_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_event))
	{
		return TRUE;
	};
};

func void info_xardas_eventwhy_info()
{
	AI_Output(hero,self,"Info_Xardas_EVENTWHY_15_01");	//�� ��� ������?
	AI_Output(self,hero,"Info_Xardas_EVENTWHY_14_02");	//����� � ���� �� ����. ����-���, �������� ����� ��� �����, �� ����� ��� �������� �� ���� ������.
};


instance INFO_XARDAS_EVENTHOW(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_eventhow_condition;
	information = info_xardas_eventhow_info;
	important = 0;
	permanent = 0;
	description = "� ��� ������� ����� ���-�� ������� � ���� �����-�������?";
};


func int info_xardas_eventhow_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_event))
	{
		return TRUE;
	};
};

func void info_xardas_eventhow_info()
{
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_01");	//� ��� ������� ����� ���-�� ������� � ���� �����-�������?
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_02");	//��. �� ��������� ���� � ������ ��, ��� ��� ����������.
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_03");	//��� �������, ��� �� ����� �� ���� �������������.
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_04");	//��� �� ������, ����� � ����� ���� ��� ���?
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_05");	//�������, ����, ��...
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_06");	//����� �� ������� ������ ����� ��������!
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_07");	//����� ����� ������. ���� �� ������ ��� ��� �������� �� ����, ������� ��, ����� ����, ��������� � �����, ������ ��� �����.
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_08");	//�� ���� ���������!
};


instance INFO_XARDAS_EVENTWHERE(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_eventwhere_condition;
	information = info_xardas_eventwhere_info;
	important = 0;
	permanent = 0;
	description = "��� ����� ����� ���������� ������?";
};


func int info_xardas_eventwhere_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_event))
	{
		return TRUE;
	};
};

func void info_xardas_eventwhere_info()
{
	AI_Output(hero,self,"Info_Xardas_EVENTWHERE_15_01");	//��� ����� ����� ���������� ������?
	AI_Output(self,hero,"Info_Xardas_EVENTWHERE_14_02");	//��� �� ������ � ������ ��������. �� ���������� ����������. ��� ����� �� ������� ���� � ����� ���� ��������.
	AI_Output(hero,self,"Info_Xardas_EVENTWHERE_15_03");	//� ��� ����� ����� ������ ���?
	AI_Output(self,hero,"Info_Xardas_EVENTWHERE_14_04");	//��� ������ ���������� ���������, �� ����� ���� ��� ������ ���������. ��� ���� �������� ����� �����.
};


instance INFO_XARDAS_ACCEPT(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_accept_condition;
	information = info_xardas_accept_info;
	important = 0;
	permanent = 0;
	description = "� ��������� ������ � ������� � ����!";
};


func int info_xardas_accept_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_eventwhy) && Npc_KnowsInfo(hero,info_xardas_eventhow) && Npc_KnowsInfo(hero,info_xardas_eventwhere))
	{
		return TRUE;
	};
};

func void info_xardas_accept_info()
{
	AI_Output(hero,self,"Info_Xardas_ACCEPT_15_01");	//� ��������� ������ � ������� � ����!
	AI_Output(self,hero,"Info_Xardas_ACCEPT_14_02");	//��� ����� ��� ������� ���� ���� ������������, ������� �������� ���������� ������ ���������� � ������ ���.
	AI_Output(self,hero,"Info_Xardas_ACCEPT_14_03");	//������� ��, ����� ���� ����� ����� ��������� ����.
	b_story_cordspost();
	b_story_findorcshaman();
	AI_StopProcessInfos(self);
};


instance KDF_404_XARDAS_SELLMAGICSTUFF(C_INFO)
{
	npc = kdf_404_xardas;
	condition = kdf_404_xardas_sellmagicstuff_condition;
	information = kdf_404_xardas_sellmagicstuff_info;
	important = 0;
	permanent = 1;
	trade = 1;
	description = "� ���� ������� ���������� ������.";
};


func int kdf_404_xardas_sellmagicstuff_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_accept))
	{
		return TRUE;
	};
};

func void kdf_404_xardas_sellmagicstuff_info()
{
	AI_Output(other,self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01");	//� ���� ������� ���������� ������.
	if(Npc_HasItems(self,demourizel))
	{
		Npc_RemoveInvItem(self,demourizel);
	};
};


instance INFO_XARDAS_RETURN(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_return_condition;
	information = info_xardas_return_info;
	important = 0;
	permanent = 0;
	description = "���-����� ������� �� ��� �������!";
};


func int info_xardas_return_condition()
{
	if(URSHAK_SPOKEOFULUMULU && !ENTEREDTEMPLE)
	{
		return TRUE;
	};
};

func void info_xardas_return_info()
{
	AI_Output(hero,self,"Info_Xardas_RETURN_15_01");	//���-����� ������� �� ��� �������!
	AI_Output(self,hero,"Info_Xardas_RETURN_14_02");	//��, � ��� �� �� ���������?
	AI_Output(hero,self,"Info_Xardas_RETURN_15_03");	//���� �������, ������� �������� �������, ��������� ��� ��������� ����, ���� � ������� ��������� � ������ �����.
	AI_Output(self,hero,"Info_Xardas_RETURN_14_04");	//���������!
	AI_Output(hero,self,"Info_Xardas_RETURN_15_05");	//�� ����������� ������ �� ������ � ������� ��, � ������� ����� �������� ���, ������ �� �������.
	AI_Output(self,hero,"Info_Xardas_RETURN_14_06");	//�������, ������.
	AI_Output(hero,self,"Info_Xardas_RETURN_15_07");	//���� ���������� ���� � ����� ��������� ������, ����� ������������ ������.
	AI_Output(self,hero,"Info_Xardas_RETURN_14_08");	//�� ��� ��������, ��� ����� ����� � ���� ����?
	AI_Output(hero,self,"Info_Xardas_RETURN_15_09");	//��, ���� ���� ���. ��...
	AI_Output(self,hero,"Info_Xardas_RETURN_14_10");	//����������, ��� ������������! ��� � ���� ��������� ����! ������ ��� �� ������� ������, ��� ��������� ������!
	AI_Output(hero,self,"Info_Xardas_RETURN_15_11");	//� ���� �� �������!
	AI_Output(self,hero,"Info_Xardas_RETURN_14_12");	//����� �� ������ �� ��� �� �� ���, ����� ������, ��� ���������� ������?
	AI_Output(hero,self,"Info_Xardas_RETURN_15_13");	//��, ��...
	AI_Output(self,hero,"Info_Xardas_RETURN_14_14");	//��� ���! ������� ����� ������� ���� �������� �������. ��� � ����� ��, ��� ������ ��������� ����!
	b_story_returnedfromurshak();
};


instance INFO_XARDAS_FOUNDTEMPLE(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_foundtemple_condition;
	information = info_xardas_foundtemple_info;
	important = 0;
	permanent = 0;
	description = "� ����, ��� ������� � ��������� ����!";
};


func int info_xardas_foundtemple_condition()
{
	if(ENTEREDTEMPLE)
	{
		return TRUE;
	};
};

func void info_xardas_foundtemple_info()
{
	AI_Output(other,self,"Info_Xardas_FOUNDTEMPLE_15_01");	//� ����, ��� ������� � ��������� ����!
	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_02");	//��� ������... �����������!
	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_03");	//�� ���� ����� �����! �������, ��� ���-���� �� ������� ������ �������.
	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_04");	//������ �����, �� � ���� ��� �����, � ������� ��������� � ������������ �����!
};


instance INFO_XARDAS_PROPHECY(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_prophecy_condition;
	information = info_xardas_prophecy_info;
	important = 0;
	permanent = 0;
	description = "�����������? � ��� ��?";
};


func int info_xardas_prophecy_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_foundtemple))
	{
		return TRUE;
	};
};

func void info_xardas_prophecy_info()
{
	AI_Output(other,self,"Info_Xardas_PROPHECY_15_01");	//�����������? � ��� ��?
	AI_Output(self,other,"Info_Xardas_PROPHECY_14_02");	//� ������� ������ �����, ���������� �� ����, ��� ��� ��������� ����, ����������� '��������� ����'.
	AI_Output(other,self,"Info_Xardas_PROPHECY_15_03");	//��������� ����?
	AI_Output(self,other,"Info_Xardas_PROPHECY_14_04");	//���, ��� ������ � �������� ��������� �������!
	AI_Output(other,self,"Info_Xardas_PROPHECY_15_05");	//��� ��� ��� ���������� � �����-�� ������� �����������? ��������, �� ����������!
	AI_Output(self,other,"Info_Xardas_PROPHECY_14_06");	//����� ����... � ����� � ���!
};


instance INFO_XARDAS_LOADSWORD(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_loadsword_condition;
	information = info_xardas_loadsword_info;
	important = 0;
	permanent = 0;
	description = "� ����� ���� ����� �������� ���.";
};


func int info_xardas_loadsword_condition()
{
	if(Npc_HasItems(hero,mythrilklinge))
	{
		return TRUE;
	};
};

func void info_xardas_loadsword_info()
{
	AI_Output(other,self,"Info_Xardas_LOADSWORD_15_01");	//� ����� ���� ����� �������� ���.
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_02");	//������-�� ��� ���.
	b_printtrademsg1("����� ��������� ���.");
	CreateInvItem(self,demourizel);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_03");	//���������... �� ��� �������� '�������'.
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_04");	//� ��� ������ ������� �� ���� ����. ��� ������� ������, ������� ��������� ������ ��� �����.
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_05");	//��� ������� �� ������������ ��� �������. ����� �� �����, ��� ��� ��� ����������.
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_06");	//�����, �� �������� �������� �����, �� ������ � �� �������� � ��� ���������� �������.
	b_printtrademsg2("������� �������.");
	Npc_RemoveInvItem(hero,mythrilklinge);
	CreateInvItem(hero,mythrilklinge01);
};


instance INFO_XARDAS_LOADSWORD01(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_loadsword01_condition;
	information = info_xardas_loadsword01_info;
	important = 0;
	permanent = 0;
	description = "������� �������� �������� �����?";
};


func int info_xardas_loadsword01_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_loadsword))
	{
		return TRUE;
	};
};

func void info_xardas_loadsword01_info()
{
	if(Npc_HasItems(self,demourizel))
	{
		Npc_RemoveInvItem(self,demourizel);
	};
	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_01");	//������� �������� �������� �����?
	AI_Output(self,other,"Info_Xardas_LOADSWORD01_14_02");	//� ������ ��������� � ���, ��� ���� ��� �������� ������� ����� ������ � ���������� � ����� �������� �����������.
	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_03");	//��� ����� ����� ������ ������� � �����?
	AI_Output(self,other,"Info_Xardas_LOADSWORD01_14_04");	//������-����� ���� ������ �������� ��� � �������� �����. ��� �� ����� ��� ������������, ������� ��� ��� ������ ��������.
	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_05");	//��� �� �� ��� ������, ��� ������!
};

instance INFO_XARDAS_LOADSWORD02(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_loadsword02_condition;
	information = info_xardas_loadsword02_info;
	important = 0;
	permanent = 0;
	description = "� ����� �� ������������ ���� ����� ����?";
};


func int info_xardas_loadsword02_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_loadsword01))
	{
		return TRUE;
	};
};

func void info_xardas_loadsword02_info()
{
	AI_Output(other,self,"Info_Xardas_LOADSWORD02_15_01");	//� ����� �� ������������ ���� ����� ����?
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_02");	//��, �� ���� ����� ����� ����� ���������� ������� �������� ���������� �������.
	AI_Output(other,self,"Info_Xardas_LOADSWORD02_15_03");	//����� �������, ��� � ��� ������� ����� ���� �� ���������� ������?
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_04");	//��, ��������, �����...
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_05");	//����� ����, ����� �������� ������ ����������, ������� �������� ������ ������� ����� ���������.
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_06");	//� ����� ��� ��������, �� ��� ����� ��� ����������� �����.
	b_story_showedurizieltoxardas();
};


instance INFO_XARDAS_BETTERARMOR(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_betterarmor_condition;
	information = info_xardas_betterarmor_info;
	important = 0;
	permanent = 0;
	description = "� � ���� ����� � ����� ���� ������� �������.";
};


func int info_xardas_betterarmor_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_loadsword02))
	{
		return TRUE;
	};
};

func void info_xardas_betterarmor_info()
{
	var C_ITEM armor;
	var int armorinstance;
	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_01");	//� � ���� ����� � ����� ���� ������� �������.
	armor = Npc_GetEquippedArmor(hero);
	armorinstance = Hlp_GetInstanceID(armor);
	if(armorinstance == crw_armor_h)
	{
		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_02");	//���� ������ �� ��������� ������� �������� ������ ��������� ����� ����� � ��������� �����.
	}
	else if((armorinstance == kdw_armor_h) || (armorinstance == kdw_armor_l))
	{
		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_03");	//��� ����� �������� ������ �� ������ ���� ��������. �������� ����� ����� � ��������� �����.
	}
	else
	{
		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_04");	//����� ����� � ������� � ��������� ����� ��� ������� ������ � ����������.
	};
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_05");	//�������� ����������� ��� ������ �����.
	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_06");	//���� ������ �����?
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_07");	//�� ����� ������ �� ������������� ��� ����������� � ���� �� ���� �� �������. �� ����� �� ��� ��� ����� �� ����.
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_08");	//��� �� ������ ����� ��������� ���������. � ���� �� ���� ������� ������� ��.
	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_09");	//��� ���� �������?
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_10");	//����� ������������� � ��� �� ���� �� ���, ���� �������� �������� ��� ������.
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_11");	//��� ���� ���� ������ ���� �����������. �� ��������� ���� �� ��������, � ������� � ������ ����� ������ ����.
	b_printtrademsg1("������� ���� ��������.");
	CreateInvItems(hero,itke_sunkentower,1);
	b_story_exploresunkentower();
};


instance INFO_XARDAS_OREARMOR(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_orearmor_condition;
	information = info_xardas_orearmor_info;
	important = 1;
	permanent = 0;
};


func int info_xardas_orearmor_condition()
{
	if(Npc_HasItems(hero,ore_armor_m) || Npc_HasItems(hero,ore_armor_h))
	{
		return TRUE;
	};
};

func void info_xardas_orearmor_info()
{
	var C_ITEM armor;
	var int armorinstance;
	armor = Npc_GetEquippedArmor(hero);
	armorinstance = Hlp_GetInstanceID(armor);
	if((armorinstance == ore_armor_m) || (armorinstance == ore_armor_h))
	{
		AI_Output(self,other,"Info_Xardas_OREARMOR_14_02");	//����, ���� ������� ����� �������� �������.
	}
	else
	{
		AI_Output(self,other,"Info_Xardas_OREARMOR_14_01");	//�, �� ����� �������� �������.
	};
	AI_Output(other,self,"Info_Xardas_OREARMOR_15_03");	//��, � ����� �� � ����� �� �������� � ���������� �����.
	AI_Output(self,other,"Info_Xardas_OREARMOR_14_04");	//�� ����������� ���� �����, ������� �������� � �������� ������ �����.
	AI_Output(other,self,"Info_Xardas_OREARMOR_15_05");	//�������, � ���� ����� �������, ��� ��.
};


instance INFO_XARDAS_FORMULA(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_formula_condition;
	information = info_xardas_formula_info;
	important = 0;
	permanent = 0;
	description = "�� ������� ���������� ��� �������� ������� ������ ���� �������?";
};


func int info_xardas_formula_condition()
{
	if(Npc_HasItems(hero,ore_armor_m) || Npc_HasItems(hero,ore_armor_h) || Npc_HasItems(hero,itarrune_1_3_teleport1))
	{
		return TRUE;
	};
};

func void info_xardas_formula_info()
{
	AI_Output(other,self,"Info_Xardas_FORMULA_15_01");	//�� ��� ������� ���������� ��� �������� ������� ������ ���� �������?
	AI_Output(self,other,"Info_Xardas_FORMULA_14_02");	//��, ��� ��� ������. �� ���� �� �� ������� ��� ��������.
	AI_Output(other,self,"Info_Xardas_FORMULA_15_03");	//������?
	AI_Output(self,other,"Info_Xardas_FORMULA_14_04");	//��� ������ ��������� ������� ���, � �� ����� ��� �� ������ ������� ��� ��� ���������� �������.
	AI_Output(other,self,"Info_Xardas_FORMULA_15_05");	//��� �, ��� �������� ����� ����, ��� ������ ��� ������.
	AI_Output(self,other,"Info_Xardas_FORMULA_14_06");	//������ ���������� � ����� ���� ��� ��� ����� ����. ��� ���� �����������!
	b_printtrademsg1("�������� ���������� �������� �������.");
	CreateInvItem(hero,scroll4milten);
	b_story_loadsword();
};


instance INFO_XARDAS_ALTRUNE(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_altrune_condition;
	information = info_xardas_altrune_info;
	important = 0;
	permanent = 0;
	description = "�� ��� ��� � �� ����� ������������ �������!";
};


func int info_xardas_altrune_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_formula) && ((Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_DMB) || (Npc_GetTrueGuild(hero) == GIL_KDF) || (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1) || Npc_KnowsInfo(hero,kdf_402_corristo_aufnahme)))
	{
		return TRUE;
	};
};

func void info_xardas_altrune_info()
{
	AI_Output(other,self,"Info_Xardas_ALTRUNE_15_01");	//�� ��� ��� � �� ����� ������������ �������!
	AI_Output(self,other,"Info_Xardas_ALTRUNE_14_02");	//� ���� ���� ������...
	AI_Output(self,other,"Info_Xardas_ALTRUNE_14_03");	//�� ������� ���������� ���� ����. ����� � �������� ���� �� ����.
	Log_CreateTopic(GE_URIZELRUNE,LOG_NOTE);
	b_logentry(GE_URIZELRUNE,"�� ����� ����� ��������� ������� ������� �������� � ���, ��� ���� ������� ����� ������������ ���� ����. �� �� ��������� ��� �� ���� ������ ����� ����, ��� � ������ ���.");
};


instance INFO_XARDAS_SWORDLOADED(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_swordloaded_condition;
	information = info_xardas_swordloaded_info;
	important = 0;
	permanent = 0;
	description = "� ������� �������!";
};


func int info_xardas_swordloaded_condition()
{
	if(Npc_HasItems(hero,mythrilklinge02))
	{
		return TRUE;
	};
};

func void info_xardas_swordloaded_info()
{
	AI_Output(other,self,"Info_Xardas_SWORDLOADED_15_01");	//� ������� �������!
	AI_Output(self,other,"Info_Xardas_SWORDLOADED_14_02");	//����������! ��� ����� ����� �� �����, ��� � � ���� ������ ��������. ������ � ���� ���� ���� �� ����� ������ ����� � ����!
	Wld_InsertItem(itarscrollteleport4,"OW_ORC_SHAMAN_ROOM2");
};


instance INFO_XARDAS_MAKERUNE(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_makerune_condition;
	information = info_xardas_makerune_info;
	important = 0;
	permanent = 0;
	description = "�� �������, ��� � ����� ������������ �������, ���� ������ �����.";
};


func int info_xardas_makerune_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_altrune) && Npc_KnowsInfo(hero,info_xardas_swordloaded))
	{
		return TRUE;
	};
};

func void info_xardas_makerune_info()
{
	AI_Output(other,self,"Info_Xardas_MAKERUNE_15_01");	//�� �������, ��� � ����� ������������ �������, ���� ���� ���� �����.
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_02");	//�������� �� ����. ��� ����� ������ ������ - ����� ��������� ������ �� ������.
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_03");	//�� ������ � ���� ��� ���� ����.
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_04");	//���� � ���� ���� ������, � ����� ������� �� ���� ����, ������� ����� �������� ����� ���������� ����.
	AI_Output(other,self,"Info_Xardas_MAKERUNE_15_05");	//���������� ���� �� �������?
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_06");	//��� ���� ������� �������� ����� ������ ��� ��, ��� ��� ������ �� ���.
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_07");	//�� ���� ���� �������: ���� ���� ������� ����� ����� ������������ ����� �������������� ����!
};


instance INFO_XARDAS_MAKERUNEDOIT(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_makerunedoit_condition;
	information = info_xardas_makerunedoit_info;
	important = 0;
	permanent = 1;
	description = "������, ������ ������ �� �������!";
};


func int info_xardas_makerunedoit_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_makerune) && Npc_HasItems(hero,mythrilklinge02))
	{
		return TRUE;
	};
};

func void info_xardas_makerunedoit_info()
{
	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_01");	//������, ������ ������ �� �������!
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 6)
	{
		AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_02");	//�� �� ��� �� �������� � ������ ���� �����!
	};
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_03");	//��� ����� ����������� ��������� ����. �� ������������� ������, ����� � ����� ������?
	Info_ClearChoices(info_xardas_makerunedoit);
	Info_AddChoice(info_xardas_makerunedoit,"��, � ���� �����!",info_xardas_makerune_yes);
	Info_AddChoice(info_xardas_makerunedoit,"���, �� ����� ����� ������!",info_xardas_makerune_no);
};

func void info_xardas_makerune_yes()
{
	Info_ClearChoices(info_xardas_makerunedoit);
	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_04");	//��, � ���� �����!
	b_printtrademsg1("����� ���������� �������.");
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_05_01");	//� ������, ��� �� �������.
	CreateInvItem(self,demourizel);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_05_02");	//���, ������ ��� � ����!
	b_printtrademsg2("������� ������� � ���� ����� ������.");
	Npc_RemoveInvItem(hero,mythrilklinge02);
	CreateInvItems(hero,itarrune_6_6_urizielrune,1);
	CreateInvItems(hero,mythrilklinge03,1);
	b_logentry(GE_URIZELRUNE,"������� ������� ���������� ������ �� ���� �������. ������ ��� ���� ���� �������� � ����, ��������� �� ����� �����.");
};

func void info_xardas_makerune_no()
{
	Info_ClearChoices(info_xardas_makerunedoit);
	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_06");	//���, �� ����� ����� ������!
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_07");	//�� ����� ���. ����� ��� �������� ���� ���������� ����.
};

instance INFO_XARDAS_LOADSWORD09_0(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_loadsword09_0_condition;
	information = info_xardas_loadsword09_0_info;
	important = 0;
	permanent = 0;
	description = "�� ������ ������� ���� ����-������?";
};

func int info_xardas_loadsword09_0_condition()
{
	if(ENTEREDTEMPLE && (Npc_GetTrueGuild(hero) == GIL_KDW || (Npc_GetTrueGuild(hero) == GIL_KDF) || Npc_KnowsInfo(hero,kdf_402_corristo_aufnahme)))
	{
		return TRUE;
	};
};

func void info_xardas_loadsword09_0_info()
{
	AI_Output(other,self,"Info_Xardas_LOADSWORD09_15_01");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_02");	//� ������� ���� � ����� ������� ����� �����.
	Log_CreateTopic(GE_TEACHEROW,LOG_NOTE);
	b_logentry(GE_TEACHEROW,"������� ������ ������� ��� ���� ����� ����������, ������� ����� �����.");
};

instance INFO_XARDAS_LOADSWORD09(C_INFO)
{
	npc = kdf_404_xardas;
	condition = info_xardas_loadsword09_condition;
	information = info_xardas_loadsword09_info;
	important = 0;
	permanent = 1;
	description = b_buildlearnstring(NAME_LEARNMAGE_6,LPCOST_TALENT_MAGE_6,0);
};


func int info_xardas_loadsword09_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_loadsword09_0) && Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 6)
	{
		return TRUE;
	};
};

func void info_xardas_loadsword09_info()
{
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW2_OK_15_01");	//������ ����� ������.
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		if(b_giveskill(other,NPC_TALENT_MAGE,6,LPCOST_TALENT_MAGE_6))
		{
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_03");	//���� ��, ��� ������ ���������� ���� ����� ������ ���������� � ������ ����. ��� ������ ������� ��, ��� ����� ��������� ������ �����.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_04");	//���� ���� - ����������� ������.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_05");	//������� �������� ������� �����, �� ������� ������ ���������� ����� ����.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_06");	//�� �� �������, ��� �� ����� ������ ����, � �� - �����.
			b_printtrademsg1("�������� ������ ������� ���������.");
			CreateInvItem(self,itarrune_6_2_armyofdarkness);
			CreateInvItem(hero,dmb_armor_m);
//			AI_EquipArmor(hero,dmb_armor_m);
			hero.guild = GIL_DMB;
			Npc_SetTrueGuild(hero,GIL_DMB);
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_07");	//���, �� ��� �� �����. � ���� ���� ������, �� �� ������� �����. ��� � ��������, �� ������� ����.
		AI_StopProcessInfos(self);
	};
};

