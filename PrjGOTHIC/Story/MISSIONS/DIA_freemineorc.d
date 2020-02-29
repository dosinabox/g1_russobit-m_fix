
instance INFO_FREEMINEORC_EXIT(C_INFO)
{
	npc = freemineorc;
	nr = 999;
	condition = info_freemineorc_exit_condition;
	information = info_freemineorc_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_freemineorc_exit_condition()
{
	return 1;
};

func void info_freemineorc_exit_info()
{
	if(!Npc_KnowsInfo(hero,info_freemineorc_everyulumulu))
	{
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_01");	//� ������ �������!
		AI_Output(self,hero,"Info_FreemineOrc_EXIT_17_02");	//����� ���� ���!
	}
	else
	{
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03");	//�������. � ������ ��� ����� �������.
		AI_Output(self,hero,"Info_FreemineOrc_EXIT_17_04");	//������� ������ �����!
	};
	if(Npc_HasItems(self,ulumulu))
	{
		Npc_RemoveInvItem(self,ulumulu);
	};
	AI_StopProcessInfos(self);
};


instance INFO_FREEMINEORC_INTRO(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_intro_condition;
	information = info_freemineorc_intro_info;
	important = 1;
	permanent = 0;
};


func int info_freemineorc_intro_condition()
{
	return TRUE;
};

func void info_freemineorc_intro_info()
{
	AI_Output(self,hero,"Info_FreemineOrc_INTRO_17_01");	//������ ������ ������! ������ ������!
};


instance INFO_FREEMINEORC_WASPASSIERT(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_waspassiert_condition;
	information = info_freemineorc_waspassiert_info;
	important = 0;
	permanent = 0;
	description = "��� ���������?";
};


func int info_freemineorc_waspassiert_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_intro))
	{
		return TRUE;
	};
};

func void info_freemineorc_waspassiert_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_WASPASSIERT_15_01");	//��� ���������?
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_02");	//������ �������� ����� ����� �������. ����� ����� ���� ������� �������.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_03");	//������� ������� ���� �����.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_04");	//������ ������� ����. ������� ������� �� ������ ����. ��� ������� ��� ���.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_05");	//������, ������, ������ ������.
};


instance INFO_FREEMINEORC_WASTUN(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_wastun_condition;
	information = info_freemineorc_wastun_info;
	important = 0;
	permanent = 0;
	description = "��� � ���� ������ ����?";
};


func int info_freemineorc_wastun_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_waspassiert))
	{
		return TRUE;
	};
};

func void info_freemineorc_wastun_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_WASTUN_15_01");	//��� � ���� ������ ����?
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_02");	//������ ������ ������� �����. � �� ������ �������.
	AI_Output(hero,self,"Info_FreemineOrc_WASTUN_15_03");	//����� ���� ����� �����?
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_04");	//��� ��� ������� ������. ������ ������ �����.
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_05");	//������ ��� �����, �� ����� �����. ������ �� �����!
};


instance INFO_FREEMINEORC_OFFER(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_offer_condition;
	information = info_freemineorc_offer_info;
	important = 0;
	permanent = 0;
	description = "� ���������� ����� ��� ����!";
};


func int info_freemineorc_offer_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_wastun) && !Npc_KnowsInfo(hero,info_freemineorc_givepotion) && !Npc_HasItems(hero,orcmedicine))
	{
		return TRUE;
	};
};

func void info_freemineorc_offer_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_OFFER_15_01");	//� ���������� ����� ��� ����!
	AI_Output(self,hero,"Info_FreemineOrc_OFFER_17_02");	//������ ������ �����. ����� �������, � �� ������ �������.
	AI_StopProcessInfos(self);
	b_story_foundorcslave();
};


instance INFO_FREEMINEORC_CRAWLER(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_crawler_condition;
	information = info_freemineorc_crawler_info;
	important = 0;
	permanent = 0;
	description = "��� ����� ��� ���?";
};


func int info_freemineorc_crawler_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_waspassiert))
	{
		return TRUE;
	};
};

func void info_freemineorc_crawler_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_CRAWLER_15_01");	//��� ����� ��� ���?
	AI_Output(self,hero,"Info_FreemineOrc_CRAWLER_17_02");	//��� ����� ������� �����, ����� ���.
	AI_Output(self,hero,"Info_FreemineOrc_CRAWLER_17_03");	//��� ��� �������! ������ ���� ���� � ����.
	AI_Output(hero,self,"Info_FreemineOrc_CRAWLER_15_04");	//��� �� �������� � ��������, � ��������� �����?
};


instance INFO_FREEMINEORC_TONGUE(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_tongue_condition;
	information = info_freemineorc_tongue_info;
	important = 0;
	permanent = 0;
	description = "�� ������ �������� �� ����� �����?";
};


func int info_freemineorc_tongue_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_intro))
	{
		return TRUE;
	};
};

func void info_freemineorc_tongue_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_TONGUE_15_01");	//�� ������ �������� �� ����� �����?
	AI_Output(self,hero,"Info_FreemineOrc_TONGUE_17_02");	//������ ��� ������� ����� ���. ������ ������� ����.
};


instance INFO_FREEMINEORC_SEARCHPOTION(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_searchpotion_condition;
	information = info_freemineorc_searchpotion_info;
	important = 0;
	permanent = 1;
	description = "� �� ���� ����� ���� �����!";
};


func int info_freemineorc_searchpotion_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_offer) && !Npc_KnowsInfo(hero,info_freemineorc_givepotion) && !Npc_HasItems(hero,orcmedicine))
	{
		return TRUE;
	};
};

func void info_freemineorc_searchpotion_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SEARCHPOTION_15_01");	//� �� ���� ����� ���� �����!
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_02");	//����� ������ ���! ����� ���� �����.
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_03");	//������ ������ �� ��� ���! ������ ���������� �����!
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_04");	//����� ������ � ����!
	AI_StopProcessInfos(self);
};


instance INFO_FREEMINEORC_SUCHEULUMULU(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_sucheulumulu_condition;
	information = info_freemineorc_sucheulumulu_info;
	important = 0;
	permanent = 0;
	description = "��, ��������, �� ���� ������ ��-����?";
};


func int info_freemineorc_sucheulumulu_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_intro))
	{
		return TRUE;
	};
};

func void info_freemineorc_sucheulumulu_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SUCHEULUMULU_15_01");	//��, ��������, �� ���� ������ ��-����?
	AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_02");	//��-��� ��� ��� ������. ��-��� ������! ������ ����� ���� �����!
	AI_Output(hero,self,"Info_FreemineOrc_SUCHEULUMULU_15_03");	//���� ���� ������ ���, ��� �� ������ ������� ��� ���� ���-����.
	if(FREEMINEORC_SUCHEPOTION == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_04");	//����� �������� ������, ������ �������� �����!
	}
	else
	{
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_05");	//������ ����� ������. ��� �����... ������ �������.
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_06");	//����� �������� �����, � ������ ��������.
	};
};


instance INFO_FREEMINEORC_GIVEPOTION(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_givepotion_condition;
	information = info_freemineorc_givepotion_info;
	important = 0;
	permanent = 0;
	description = "���, � ����� ���� �����!";
};


func int info_freemineorc_givepotion_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_wastun) && Npc_HasItems(hero,orcmedicine))
	{
		return TRUE;
	};
};

func void info_freemineorc_givepotion_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_GIVEPOTION_15_01");	//���, � ����� ���� �����!
	b_printtrademsg1("������ ����� ����.");
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_02");	//����� �� ������, ��� ������ ������! ����� �������!
	b_giveinvitems(hero,self,orcmedicine,1);
	EquipItem(self,orcmedicine);
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_GUARDSIT_2_STAND",BS_STAND);
		//AI_Standup(self);
		//AI_TurnToNPC(self,hero);
	};
	//AI_UseItemToState(self,orcmedicine,1);
	//AI_UseItemToState(self,orcmedicine,-1);
	AI_PlayAniBS(self,"T_POTIONFAST_S0_2_STAND",BS_ITEMINTERACT);
	AI_UseItem(self,orcmedicine);
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_03");	//������ ������� �������!
	AI_Output(hero,self,"Info_FreemineOrc_GIVEPOTION_15_04");	//� �� ������ ���� ��� ���-����?
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_05");	//����� �������� ������, ������ �������� �����!
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_06");	//����� ���� ������, ���-���, �������� � ���-�����.
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_07");	//����� �������� ��� � ������ ������ ���-����.
	if(!Npc_KnowsInfo(hero,info_freemineorc_offer))
	{
		b_story_foundorcslave();
	};
	b_story_curedorc();
};


instance INFO_FREEMINEORC_FIREWARAN(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_firewaran_condition;
	information = info_freemineorc_firewaran_info;
	important = 0;
	permanent = 0;
	description = "��� ����� ������?";
};


func int info_freemineorc_firewaran_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_givepotion))
	{
		return TRUE;
	};
};

func void info_freemineorc_firewaran_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_FIREWARAN_15_01");	//��� ����� ������?
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN_17_02");	//���� ����! ���� ���� ������� ����!
};


instance INFO_FREEMINEORC_FIREWARAN2(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_firewaran2_condition;
	information = info_freemineorc_firewaran2_info;
	important = 0;
	permanent = 0;
	description = "� ��� ����� ��� ������� ����?";
};


func int info_freemineorc_firewaran2_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_firewaran) && !Npc_HasItems(hero,itat_waran_01) && !Npc_KnowsInfo(hero,info_freemineorc_everyulumulu))
	{
		return TRUE;
	};
};

func void info_freemineorc_firewaran2_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_FIREWARAN2_15_01");	//� ��� ����� ��� ������� ����?
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN2_17_02");	//������� ���� ���� ����. ���� ������. ����� ������ ������!
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN2_17_03");	//��� ���� ������� ���� ����� ������� ����.
	b_logentry(CH4_ULUMULU,"����� ������� ���-����, ������� ����� ���� �������� �������. ����� ������� ����� � ������ ����� � �� �������� ������� ��������. ���� �����, � ���� ����� ���� ����� �����...");
};


instance INFO_FREEMINEORC_SHADOWBEAST(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_shadowbeast_condition;
	information = info_freemineorc_shadowbeast_info;
	important = 0;
	permanent = 0;
	description = "��� ������ ���-���?";
};


func int info_freemineorc_shadowbeast_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_givepotion))
	{
		return TRUE;
	};
};

func void info_freemineorc_shadowbeast_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SHADOWBEAST_Info_15_01");	//��� ������ ���-���?
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST_Info_17_02");	//��� ��������. ������ ��� ���, ������� ��� ������.
};


instance INFO_FREEMINEORC_SHADOWBEAST2(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_shadowbeast2_condition;
	information = info_freemineorc_shadowbeast2_info;
	important = 0;
	permanent = 0;
	description = "��� � ����� ����� ����������?";
};


func int info_freemineorc_shadowbeast2_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_shadowbeast) && !Npc_HasItems(hero,itat_shadow_02) && !Npc_KnowsInfo(hero,info_freemineorc_everyulumulu))
	{
		return TRUE;
	};
};

func void info_freemineorc_shadowbeast2_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SHADOWBEAST2_Info_15_01");	//��� � ����� ����� ����������?
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_02");	//���� � ��� ��� ������. �� ������ ����.
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_03");	//����� �������. ����� ���� ����������!
	b_logentry(CH4_ULUMULU,"� ������ �������� ������� ��� ���������. ��� ����� � ������ ������� � �����. ��������� � ����, ����� ������ � �������� �������� ���� ����� ������ ������ ���.");
};


instance INFO_FREEMINEORC_SWAMPSHARK(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_swampshark_condition;
	information = info_freemineorc_swampshark_info;
	important = 0;
	permanent = 0;
	description = "��������? � ��� ��� �����?";
};


func int info_freemineorc_swampshark_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_givepotion))
	{
		return TRUE;
	};
};

func void info_freemineorc_swampshark_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SWAMPSHARK_15_01");	//��������? � ��� ��� �����?
	AI_Output(self,hero,"Info_FreemineOrc_SWAMPSHARK_17_02");	//��� �� ���������. ����� �� ������, ����� ������ �� �������.
};


instance INFO_FREEMINEORC_SWAMPSHARK2(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_swampshark2_condition;
	information = info_freemineorc_swampshark2_info;
	important = 0;
	permanent = 0;
	description = "��� ����� ����������?";
};


func int info_freemineorc_swampshark2_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_swampshark) && !Npc_HasItems(hero,itat_swampshark_02) && !Npc_KnowsInfo(hero,info_freemineorc_everyulumulu))
	{
		return TRUE;
	};
};

func void info_freemineorc_swampshark2_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SWAMPSHARK2_15_01");	//��� ����� ����������?
	AI_Output(self,hero,"Info_FreemineOrc_SWAMPSHARK2_17_02");	//����� ����� ��� ������ �����. ������ �� ������!
	b_logentry(CH4_ULUMULU,"� ������ ������ ��� ������� ����� ����������. ��� �������� � �������� ����������� ������� � ������� ����� ������ ��������.");
};


instance INFO_FREEMINEORC_TROLL(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_troll_condition;
	information = info_freemineorc_troll_info;
	important = 0;
	permanent = 0;
	description = "��� ����� ���-�����?";
};


func int info_freemineorc_troll_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_givepotion))
	{
		return TRUE;
	};
};

func void info_freemineorc_troll_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_TROLL_15_01");	//��� ����� ���-�����?
	AI_Output(self,hero,"Info_FreemineOrc_TROLL_17_02");	//��� ������� ������! ������ ����� ��������!
};


instance INFO_FREEMINEORC_TROLL2(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_troll2_condition;
	information = info_freemineorc_troll2_info;
	important = 0;
	permanent = 0;
	description = "� ��� ����� ����� ������?";
};


func int info_freemineorc_troll2_condition()
{
	if(Npc_KnowsInfo(hero,info_freemineorc_troll) && !Npc_HasItems(hero,itat_troll_02) && !Npc_KnowsInfo(hero,info_freemineorc_everyulumulu))
	{
		return TRUE;
	};
};

func void info_freemineorc_troll2_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_TROLL2_15_01");	//� ��� ����� ����� ������?
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_02");	//������ ���� ��� ����! ������ ����� �����!
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_03");	//����� ������ � ���� �� �����! ������ ������� ����� ������!
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_04");	//����� ����, ����� ������ ����!
	b_logentry(CH4_ULUMULU,"��� ���-���� ������� ����� �������� ���� ������. ��� �������� ����� ����� � ����� �������. ��� ����� �������� �� ������ ���.");
};


instance INFO_FREEMINEORC_LOOKINGULUMULU(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_lookingulumulu_condition;
	information = info_freemineorc_lookingulumulu_info;
	important = 0;
	permanent = 1;
	description = "� ��� �� ��� ������.";
};


func int info_freemineorc_lookingulumulu_condition()
{
	if((FREEMINEORC_LOOKINGULUMULU == LOG_RUNNING) && (!Npc_HasItems(hero,itat_waran_01) || !Npc_HasItems(hero,itat_shadow_02) || !Npc_HasItems(hero,itat_swampshark_02) || !Npc_HasItems(hero,itat_troll_02)) && Npc_KnowsInfo(hero,info_freemineorc_firewaran2) && Npc_KnowsInfo(hero,info_freemineorc_shadowbeast2) && Npc_KnowsInfo(hero,info_freemineorc_swampshark2) && Npc_KnowsInfo(hero,info_freemineorc_troll2))
	{
		return TRUE;
	};
};

func void info_freemineorc_lookingulumulu_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_LOOKINGULUMULU_15_01");	//� ��� �� ��� ������.
	AI_Output(self,hero,"Info_FreemineOrc_LOOKINGULUMULU_17_02");	//����� ������. ������ ����� �����!
	AI_StopProcessInfos(self);
};


instance INFO_FREEMINEORC_EVERYULUMULU(C_INFO)
{
	npc = freemineorc;
	condition = info_freemineorc_everyulumulu_condition;
	information = info_freemineorc_everyulumulu_info;
	important = 0;
	permanent = 0;
	description = "������ � ���� ���� ���, ��� ����� ��� ���-����!";
};


func int info_freemineorc_everyulumulu_condition()
{
	if((FREEMINEORC_LOOKINGULUMULU == LOG_RUNNING) && Npc_HasItems(hero,itat_waran_01) && Npc_HasItems(hero,itat_shadow_02) && Npc_HasItems(hero,itat_swampshark_02) && Npc_HasItems(hero,itat_troll_02))
	{
		return TRUE;
	};
};

func void info_freemineorc_everyulumulu_info()
{
	AI_Output(hero,self,"Info_FreemineOrc_EVERYULUMULU_15_01");	//������ � ���� ���� ���, ��� ����� ��� ���-����!
	AI_Output(self,hero,"Info_FreemineOrc_EVERYULUMULU_17_02");	//����� ������� ������! ���� ��� ����! ������ ������ ���-����!
	b_printtrademsg1("������ 4 ������.");
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_GUARDSIT_2_STAND",BS_STAND);
	};
	AI_TurnAway(self,hero);
	AI_PlayAni(self,"T_DIALOGGESTURE_05");
	CreateInvItem(self,ulumulu);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_DIALOGGESTURE_07");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_WhirlAround(self,hero);
	AI_Output(self,hero,"Info_FreemineOrc_EVERYULUMULU_17_03");	//���! ����� ����� ���-���� � ���� ������! ������ ������ �����!
	b_printtrademsg2("�������� ���-����.");
	Npc_RemoveInvItem(hero,itat_shadow_02);
	Npc_RemoveInvItem(hero,itat_swampshark_02);
	Npc_RemoveInvItem(hero,itat_troll_02);
	Npc_RemoveInvItem(hero,itat_waran_01);
	b_story_gotulumulu();
	AI_StopProcessInfos(self);
};

