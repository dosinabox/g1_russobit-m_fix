
instance GRD_262_AARON_EXIT(C_INFO)
{
	npc = grd_262_aaron;
	nr = 999;
	condition = grd_262_aaron_exit_condition;
	information = grd_262_aaron_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int grd_262_aaron_exit_condition()
{
	return 1;
};

func void grd_262_aaron_exit_info()
{
	AI_StopProcessInfos(self);
};


instance GRD_262_AARON_CHEST(C_INFO)
{
	npc = grd_262_aaron;
	condition = grd_262_aaron_chest_condition;
	information = grd_262_aaron_chest_info;
	important = 0;
	permanent = 0;
	description = "��� �� ����� �������?";
};


func int grd_262_aaron_chest_condition()
{
	if((Npc_GetDistToWP(self,"OM_CAVE1_34") < 400) && !Npc_KnowsInfo(hero,grd_262_aaron_bluff))
	{
		return 1;
	};
};

func void grd_262_aaron_chest_info()
{
	AI_Output(other,self,"GRD_262_Aaron_CHEST_Info_15_01");	//��� �� ����� �������?
	AI_Output(self,other,"GRD_262_Aaron_CHEST_Info_09_02");	//������� ���� ������, ����� �������� ���� ������� �� ����� � ����.
};


instance GRD_262_AARON_BLUFF(C_INFO)
{
	npc = grd_262_aaron;
	condition = grd_262_aaron_bluff_condition;
	information = grd_262_aaron_bluff_info;
	important = 0;
	permanent = 1;
	description = "(������� ������)";
};


func int grd_262_aaron_bluff_condition()
{
	if(Npc_KnowsInfo(hero,vlk_584_snipes_deal) && (AARON_LOCK != LOG_RUNNING) && (AARON_LOCK != LOG_SUCCESS))
	{
		return 1;
	};
};

func void grd_262_aaron_bluff_info()
{
	Info_ClearChoices(grd_262_aaron_bluff);
	Info_AddChoice(grd_262_aaron_bluff,DIALOG_BACK,grd_262_aaron_bluff_back);
	Info_AddChoice(grd_262_aaron_bluff,"���� ������� ��. �� ������, ��� ����� ������ ����!",grd_262_aaron_bluff_ian);
	Info_AddChoice(grd_262_aaron_bluff,"� ������, ��� � ����� ���������� ����. ��� ����� ������� ����.",grd_262_aaron_bluff_bandit);
	Info_AddChoice(grd_262_aaron_bluff,"�������� ����� �������� ����� ����!",grd_262_aaron_bluff_ore);
};

func void grd_262_aaron_bluff_ore()
{
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_ORE_15_01");	//�������� ����� �������� ����� ����!
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_ORE_09_02");	//�� � ���?
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_ORE_15_03");	//�����, ���� ��������� ����� ���������� �� ����.
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_ORE_09_04");	//�� �� ���.
};

func void grd_262_aaron_bluff_bandit()
{
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_BANDIT_15_01");	//� ������, ��� � ����� ���������� ����. ��� ����� ������� ����.
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_BANDIT_09_02");	//�������, � ����� �����, ��� ������ �����? �� ����� �� ��������� ���� � ���� ������.
};

func void grd_262_aaron_bluff_ian()
{
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_IAN_15_01");	//���� ������� ��. �� ������, ��� ����� ������ ����!
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_IAN_09_02");	//���� �� �����?
	Info_ClearChoices(grd_262_aaron_bluff);
	Info_AddChoice(grd_262_aaron_bluff,"�, �� ����...",grd_262_aaron_bluff_ugly);
	Info_AddChoice(grd_262_aaron_bluff,"�� ����� �������� ����. �������, ��� �� ����������, ����� ����.",grd_262_aaron_bluff_bad);
	Info_AddChoice(grd_262_aaron_bluff,"�� ����� ��������� ���� �� ���� ������.",grd_262_aaron_bluff_good);
};

func void grd_262_aaron_bluff_good()
{
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_GOOD_15_01");	//�� ����� ��������� ���� �� ���� ������.
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_GOOD_09_02");	//������? ���� ���, �������� ���� ������� ��� �������.
	Npc_SetTempAttitude(self,ATT_ANGRY);
	AI_StopProcessInfos(self);
};

func void grd_262_aaron_bluff_bad()
{
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_BAD_15_01");	//�� ����� �������� ����. �������, ��� �� ����������, ����� ����.
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_BAD_09_02");	//������ ��� ��� ��? ����� �������� ������.
	AI_StopProcessInfos(self);
};

func void grd_262_aaron_bluff_ugly()
{
	AI_Output(other,self,"GRD_262_Aaron_BLUFF_UGLY_15_01");	//�, �� ����, ���� �� ��� �����. ����� � ���� � ��� �����. �������, �� ��������� �� ��� �� ����?
	AI_Output(self,other,"GRD_262_Aaron_BLUFF_UGLY_09_02");	//������, ��� ���!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"trick");
	AARON_LOCK = LOG_RUNNING;
	SNIPES_DEAL = LOG_SUCCESS;
	grd_262_aaron_bluff.permanent = 0;
	b_logentry(CH2_SNIPESDEAL,"� ������ ������, ��� �� ����� ��� ������. �� ���� ����. �������, � ���� ���� ������� �����...");
};

func void grd_262_aaron_bluff_back()
{
	Info_ClearChoices(grd_262_aaron_bluff);
};


instance GRD_262_AARON_PISSED(C_INFO)
{
	npc = grd_262_aaron;
	condition = grd_262_aaron_pissed_condition;
	information = grd_262_aaron_pissed_info;
	important = 1;
	permanent = 0;
};


func int grd_262_aaron_pissed_condition()
{
	if((AARON_LOCK == LOG_RUNNING) && (Npc_GetDistToWP(hero,"OM_CAVE1_47") < 1000))
	{
		return TRUE;
	};
};

func void grd_262_aaron_pissed_info()
{
	AI_DrawWeapon(self);
	AI_Output(self,other,"Info_Aaron_PISSED_09_01");	//��, ������! ��������� ����� ����� ����� ��� ���� ���������, �����?
	AI_RemoveWeapon(self);
	Npc_ExchangeRoutine(self,"start");
	AARON_LOCK = LOG_SUCCESS;
	b_logentry(CH2_SNIPESDEAL,"� ����� �������� ������. ������ � ����, ��� ������� ����� � ���� ���.");
};


instance GRD_262_AARON_SELL(C_INFO)
{
	npc = grd_262_aaron;
	condition = grd_262_aaron_sell_condition;
	information = grd_262_aaron_sell_info;
	important = 0;
	permanent = 0;
	description = "��, �� �� ����� ���� �� ������ �������?";
};


func int grd_262_aaron_sell_condition()
{
	if(Npc_KnowsInfo(hero,vlk_584_snipes_deal_run))
	{
		return 1;
	};
};

func void grd_262_aaron_sell_info()
{
	AI_Output(other,self,"Info_Aaron_SELL_15_01");	//��, �� �� ����� ���� �� ������ �������?
	AI_Output(self,other,"Info_Aaron_SELL_09_02");	//�����. ���� �� ���� ������������, ������ �� ����� �� ���� �����.
	AI_Output(self,other,"Info_Aaron_SELL_09_03");	//�������� ������, ���� �� ������� ��� ����.
	b_logentry(CH2_SNIPESDEAL,"����� ���� ��� 20 ������ ����, ���� � ����� ���� �� ��� �������!");
};


instance GRD_262_AARON_SELLNOW(C_INFO)
{
	npc = grd_262_aaron;
	condition = grd_262_aaron_sellnow_condition;
	information = grd_262_aaron_sellnow_info;
	important = 0;
	permanent = 0;
	description = "(������� ����)";
};


func int grd_262_aaron_sellnow_condition()
{
	if(Npc_KnowsInfo(hero,grd_262_aaron_sell) && Npc_HasItems(hero,itke_om_02))
	{
		return 1;
	};
};

func void grd_262_aaron_sellnow_info()
{
	AI_Output(other,self,"Info_Aaron_SELLNOW_15_01");	//��� ���� ����.
	b_printtrademsg1("����� ����.");
	AI_Output(self,other,"Info_Aaron_SELLNOW_09_02");	//��� ����, �����. ���, ��� �� � ��������������, ���� �������� ������ ����.
	b_printtrademsg2("�������� ����: 20");
	AI_Output(self,other,"Info_Aaron_SELLNOW_09_03");	//��, � ������� � � ���� ���� ��� �� �����!
	CreateInvItems(self,itminugget,20);
	b_giveinvitems(self,other,itminugget,20);
	b_giveinvitems(hero,self,itke_om_02,1);
	b_givexp(XP_SELLKEYTOAARON);
	b_logentry(CH2_SNIPESDEAL,"� ������ ������ ���� �� ��� �������. � ���� ���� � ��� ���� ������� ������!");
	Log_SetTopicStatus(CH2_SNIPESDEAL,LOG_SUCCESS);
};

