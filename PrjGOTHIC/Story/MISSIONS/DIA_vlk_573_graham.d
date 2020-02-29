
instance DIA_GRAHAM_EXIT(C_INFO)
{
	npc = vlk_573_graham;
	nr = 999;
	condition = info_graham_exit_condition;
	information = info_graham_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_graham_exit_condition()
{
	return 1;
};

func void info_graham_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRAHAM_HELLO(C_INFO)
{
	npc = vlk_573_graham;
	nr = 3;
	condition = dia_graham_hello_condition;
	information = dia_graham_hello_info;
	permanent = 0;
	description = "������! � ����� �������.";
};


func int dia_graham_hello_condition()
{
	return 1;
};

func void dia_graham_hello_info()
{
	AI_Output(other,self,"DIA_Graham_Hello_15_00");	//������! � ����� �������.
	AI_Output(self,other,"DIA_Graham_Hello_02_01");	//���� ����� ������. � ����� �����. � ���� ������ �� �����... ��� ���� �����?
	b_logentry(GE_TRADEROC,"������� ������ ������� �����. ��� ����� ����� ����� �� ������� �����.");
};


var int graham_omkarteverkauft;
var int graham_omkarteerpresst;

instance DIA_GRAHAM_SELLMAP(C_INFO)
{
	npc = vlk_573_graham;
	nr = 3;
	condition = dia_graham_sellmap_condition;
	information = dia_graham_sellmap_info;
	permanent = 1;
	description = "����� ������ ���, ��� � ���� ����� � ���� �����...";
};


func int dia_graham_sellmap_condition()
{
	if(Npc_KnowsInfo(hero,dia_graham_hello) && Npc_KnowsInfo(hero,info_diego_maptooldmine) && (GRAHAM_OMKARTEVERKAUFT == FALSE) && (GRAHAM_OMKARTEERPRESST == FALSE))
	{
		return 1;
	};
};

func void dia_graham_sellmap_info()
{
	AI_Output(other,self,"DIA_Graham_SellMap_15_00");	//����� ������ ���, ��� � ���� ����� � ���� �����, �� ������� ��������� ���� � ������ �����.
	AI_Output(self,other,"DIA_Graham_SellMap_02_01");	//������� �������. ������ ��� ����... 20 ������ ����.
	Info_ClearChoices(dia_graham_sellmap);
	Info_AddChoice(dia_graham_sellmap,"��� ��������!",dia_graham_sellmap_back);
	Info_AddChoice(dia_graham_sellmap,"� ����� � ���� �����. ��� ����.",dia_graham_sellmap_pay);
	Info_AddChoice(dia_graham_sellmap,"����� �����, ��� � ������ �� ���!",dia_graham_sellmap_aufsmaul);
	Info_AddChoice(dia_graham_sellmap,"������, ����� ������ ���, ��� �� ���� ��� �����, � �� �������.",dia_graham_sellmap_givenotsell);
};

func void dia_graham_sellmap_back()
{
	AI_Output(other,self,"DIA_Graham_SellMap_BACK_15_00");	//��� ��������!
	Info_ClearChoices(dia_graham_sellmap);
};

func void dia_graham_sellmap_pay()
{
	AI_Output(other,self,"DIA_Graham_SellMap_Pay_15_00");	//� ����� � ���� �����. ��� ����.
	if(Npc_HasItems(other,itminugget) >= 20)
	{
		AI_Output(self,other,"DIA_Graham_SellMap_Pay_02_01");	//�����. ������ ���, ������, �� �� ����� �� ������ ����� ����� �� ��� ������.
		b_giveinvitems(other,self,itminugget,20);
		b_giveinvitems(self,other,itwrommap,1);
		GRAHAM_OMKARTEVERKAUFT = TRUE;
		Info_ClearChoices(dia_graham_sellmap);
	}
	else
	{
		AI_Output(self,other,"DIA_Graham_SellMap_Pay_NoOre_02_00");	//������ ������ ����. ��������� ��� ��������� �����, ������ ����� ������� � ��� � ������.
	};
};

func void dia_graham_sellmap_aufsmaul()
{
	AI_Output(other,self,"DIA_Graham_SellMap_AufsMaul_15_00");	//����� �����, ��� � ������ �� ���!
	AI_Output(self,other,"DIA_Graham_SellMap_AufsMaul_02_01");	//��, ����������, �������! ��� �� ����� ������������. ���, ������ ���� ����� � ������ ���� � �����.
	b_giveinvitems(self,other,itwrommap,1);
	Info_ClearChoices(dia_graham_sellmap);
	npc_setpermattitude(self,ATT_ANGRY);
	GRAHAM_OMKARTEERPRESST = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_graham_sellmap_givenotsell()
{
	AI_Output(other,self,"DIA_Graham_SellMap_GiveNotSell_15_00");	//������, ����� ������ ���, ��� �� ���� ��� �����, � �� �������.
	AI_Output(self,other,"DIA_Graham_SellMap_GiveNotSell_02_01");	//�� ���-�� ��� � ����?! �� ���� ������������� ����, ��� ������ ���������� ����� �����?
	AI_Output(self,other,"DIA_Graham_SellMap_GiveNotSell_02_02");	//20 - ��� ��� ����������� ���� ��� ������ �����. ������ � ���� 50.
};


instance DIA_GRAHAM_BUYMAPS(C_INFO)
{
	npc = vlk_573_graham;
	nr = 800;
	condition = dia_graham_buymaps_condition;
	information = dia_graham_buymaps_info;
	permanent = 1;
	description = "� ���� ������ �����.";
	trade = 1;
};


func int dia_graham_buymaps_condition()
{
	if(Npc_KnowsInfo(hero,dia_graham_hello))
	{
		return 1;
	};
};

func void dia_graham_buymaps_info()
{
	AI_Output(other,self,"DIA_Graham_BuyMaps_15_00");	//� ���� ������ �����.
	AI_Output(self,other,"DIA_Graham_BuyMaps_02_01");	//�������... ����� ���� �����? ��� ������ ����� �� ��� ����������, ��� ������ ��� �����.
};

