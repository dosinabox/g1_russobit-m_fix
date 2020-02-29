
instance ORG_873_CIPHER_EXIT(C_INFO)
{
	npc = org_873_cipher;
	nr = 999;
	condition = org_873_cipher_exit_condition;
	information = org_873_cipher_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int org_873_cipher_exit_condition()
{
	return TRUE;
};

func void org_873_cipher_exit_info()
{
	AI_StopProcessInfos(self);
};


instance ORG_873_CIPHER_HELLO(C_INFO)
{
	npc = org_873_cipher;
	nr = 1;
	condition = org_873_cipher_hello_condition;
	information = org_873_cipher_hello_info;
	permanent = 0;
	description = "��� ����?";
};


func int org_873_cipher_hello_condition()
{
	if(BALOR_TELLSNCDEALER == TRUE)
	{
		return 1;
	};
};

func void org_873_cipher_hello_info()
{
	AI_Output(other,self,"DIA_Cipher_Hello_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Cipher_Hello_12_01");	//��� ������! ������ ������ ����.
	AI_Output(self,other,"DIA_Cipher_Hello_12_02");	//��� ������ ��������� � ��������� ������ �����. �� ��� ����� ������!
	AI_Output(other,self,"DIA_Cipher_Hello_15_03");	//��� �� ���� �� ���, ��� ��������� ��������� ������ �� ������ ������?
	AI_Output(self,other,"DIA_Cipher_Hello_12_04");	//���. ������ ����� ����� ������������ ������� ����.
};


instance ORG_873_CIPHER_FISK(C_INFO)
{
	npc = org_873_cipher;
	nr = 1;
	condition = org_873_cipher_fisk_condition;
	information = org_873_cipher_fisk_info;
	permanent = 1;
	description = "���� �� ������� ������ ���� ����, ��� ��� �� ��� ��������.";
};


func int org_873_cipher_fisk_condition()
{
	if(FISK_GETNEWHEHLER == LOG_RUNNING)
	{
		return 1;
	};
};

func void org_873_cipher_fisk_info()
{
	AI_Output(other,self,"DIA_Cipher_Fisk_15_00");	//���� �� ������� ������ ���� ����, ��� ��� �� ��� ��������.
	AI_Output(self,other,"DIA_Cipher_Fisk_12_01");	//� ��� ��� �����������.
	AI_Output(self,other,"DIA_Cipher_Fisk_12_02");	//� ��� ����� ��� ����, ������ �����, ����������.
};


var int cipher_trade;

instance ORG_873_CIPHER_FROMBALOR(C_INFO)
{
	npc = org_873_cipher;
	nr = 1;
	condition = org_873_cipher_frombalor_condition;
	information = org_873_cipher_frombalor_info;
	permanent = 1;
	description = "��� �� ������ ��� ����������?";
};


func int org_873_cipher_frombalor_condition()
{
	if(Npc_KnowsInfo(hero,org_873_cipher_hello))
	{
		return 1;
	};
};

func void org_873_cipher_frombalor_info()
{
	AI_Output(other,self,"DIA_Cipher_FromBalor_15_00");	//��� �� ������ ��� ����������?
	AI_Output(self,other,"DIA_Cipher_FromBalor_12_01");	//�����, ����� �������� ���: ��� �� ������ ����������? ���� ���������� ������ ������� ����.
	if(BALOR_TELLSNCDEALER == TRUE)
	{
		AI_Output(other,self,"DIA_Cipher_FromBalor_15_02");	//����� ������ ���, ��� ���� ���������� ��������.
		AI_Output(self,other,"DIA_Cipher_FromBalor_12_03");	//��. ��� �� ������ ��� �������, ��?
		CIPHER_TRADE = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Cipher_FromBalor_15_04");	//���� ���. � �� ����.
		AI_Output(self,other,"DIA_Cipher_FromBalor_12_05");	//��� �����������, ����� �������.
	};
};


instance ORG_873_CIPHER_TRADE(C_INFO)
{
	npc = org_873_cipher;
	nr = 1;
	condition = org_873_cipher_trade_condition;
	information = org_873_cipher_trade_info;
	permanent = 1;
	description = "��������� ������.";
	trade = 1;
};


func int org_873_cipher_trade_condition()
{
	if(CIPHER_TRADE == TRUE)
	{
		return 1;
	};
};

func void org_873_cipher_trade_info()
{
	AI_Output(other,self,"DIA_Cipher_TRADE_15_00");	//��������� ������.
	AI_Output(self,other,"DIA_Cipher_TRADE_12_01");	//��� �� ������?
};

