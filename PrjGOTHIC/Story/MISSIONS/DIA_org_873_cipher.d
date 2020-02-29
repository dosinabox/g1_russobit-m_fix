
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
	description = "Как дела?";
};


func int org_873_cipher_hello_condition()
{
	return 1;
};

func void org_873_cipher_hello_info()
{
	AI_Output(other,self,"DIA_Cipher_Hello_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Cipher_Hello_12_01");	//Как всегда! Мешаем Гомезу жить.
	AI_Output(self,other,"DIA_Cipher_Hello_12_02");	//Три убитых стражника и несколько ценных вещей. За это стоит выпить!
	AI_Output(other,self,"DIA_Cipher_Hello_15_03");	//Так ты один из тех, кто постоянно совершает налеты на Старый лагерь?
	AI_Output(self,other,"DIA_Cipher_Hello_12_04");	//Нет. Только когда может подвернуться стоящее дело.
};


instance ORG_873_CIPHER_FISK(C_INFO)
{
	npc = org_873_cipher;
	nr = 1;
	condition = org_873_cipher_fisk_condition;
	information = org_873_cipher_fisk_info;
	permanent = 1;
	description = "Фиск из Старого лагеря ищет того, кто мог бы ему помогать.";
};


func int org_873_cipher_fisk_condition()
{
	if(FISK_GETNEWHEHLER == LOG_RUNNING && !Npc_KnowsInfo(hero,org_843_sharky_fisk))
	{
		return 1;
	};
};

func void org_873_cipher_fisk_info()
{
	AI_Output(other,self,"DIA_Cipher_Fisk_15_00");	//Фиск из Старого лагеря ищет того, кто мог бы ему помогать.
	AI_Output(self,other,"DIA_Cipher_Fisk_12_01");	//А мне это неинтересно.
	AI_Output(self,other,"DIA_Cipher_Fisk_12_02");	//А вот Шарки эта идея, скорее всего, понравится.
};


var int cipher_trade;

instance ORG_873_CIPHER_FROMBALOR(C_INFO)
{
	npc = org_873_cipher;
	nr = 1;
	condition = org_873_cipher_frombalor_condition;
	information = org_873_cipher_frombalor_info;
	permanent = 1;
	description = "Что ты можешь мне предложить?";
};


func int org_873_cipher_frombalor_condition()
{
	if(Npc_KnowsInfo(hero,org_873_cipher_hello) && CIPHER_TRADE == FALSE)
	{
		return 1;
	};
};

func void org_873_cipher_frombalor_info()
{
	AI_Output(other,self,"DIA_Cipher_FromBalor_15_00");	//Что ты можешь мне предложить?
	AI_Output(self,other,"DIA_Cipher_FromBalor_12_01");	//Может, лучше спросить так: что ты можешь предложить? Меня интересуют только крупные дела.
	if(BALOR_TELLSNCDEALER == TRUE)
	{
		AI_Output(other,self,"DIA_Cipher_FromBalor_15_02");	//Бэлор сказал мне, что тебя интересует болотник.
		AI_Output(self,other,"DIA_Cipher_FromBalor_12_03");	//Хм. Так ты хочешь его продать, да?
		CIPHER_TRADE = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Cipher_FromBalor_15_04");	//Пока нет. Я не могу.
		AI_Output(self,other,"DIA_Cipher_FromBalor_12_05");	//Так возвращайся, когда сможешь.
	};
};


instance ORG_873_CIPHER_TRADE(C_INFO)
{
	npc = org_873_cipher;
	nr = 1;
	condition = org_873_cipher_trade_condition;
	information = org_873_cipher_trade_info;
	permanent = 1;
	description = "Предлагаю сделку.";
};


func int org_873_cipher_trade_condition()
{
	if(CIPHER_TRADE == TRUE && BALOR_CAN_GIVE == FALSE)
	{
		return 1;
	};
};

func void org_873_cipher_trade_info()
{
	AI_Output(other,self,"DIA_Cipher_TRADE_15_00");	//Предлагаю сделку.
	AI_Output(self,other,"SVM_12_WhatDoYouWant");	//Чем могу помочь?
	AI_Output(other,self,"Info_Org_6_Krautprobe_15_00");	//У меня есть болотник. Хочешь?
	if(Npc_HasItems(other,weedpack) >= 1)
	{
		b_printtrademsg1("Отдан пакет с травой.");
		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_01");	//Договорились!
		b_printtrademsg2("Получено руды: 250");
		Npc_RemoveInvItems(hero,weedpack,1);
		CreateInvItems(hero,itminugget,250);
		BALOR_CAN_GIVE = TRUE;
	}
	else
	{
		AI_Output(self,other,"SVM_12_YouWannaFoolMe");	//Обмануть меня захотел? Только попробуй!
	};
};

instance ORG_873_CIPHER_TRADE2(C_INFO)
{
	npc = org_873_cipher;
	nr = 1;
	condition = org_873_cipher_trade2_condition;
	information = org_873_cipher_trade2_info;
	permanent = 1;
	description = "Покажи мне свои товары.";
	trade = 1;
};


func int org_873_cipher_trade2_condition()
{
	if(CIPHER_TRADE == TRUE)
	{
		return 1;
	};
};

func void org_873_cipher_trade2_info()
{
	AI_Output(other,self,"DIA_BaalKagan_TRADE_15_00");	//Покажи мне свои товары.
};

