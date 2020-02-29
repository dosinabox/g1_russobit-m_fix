
func void bsfire_s1()
{
	if(Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		AI_Wait(self,11.7);
		b_stopusemob(self,"BSFIRE");
	};
};

func void bsfire_s0()
{
	if(Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};



func int bsanvil_cf()
{
	if(Npc_IsPlayer(self))
	{
		if(Npc_HasItems(self,itmw_1h_sledgehammer_01))
		{
			var C_ITEM currentequippedweapon;
			var int currentequippedweaponinstance;
			currentequippedweapon = Npc_GetEquippedMeleeWeapon(hero);
			currentequippedweaponinstance = Hlp_GetInstanceID(currentequippedweapon);
			if(currentequippedweaponinstance == itmw_1h_sledgehammer_01)
			{
				AI_UnequipWeapons(hero);
			};
			return TRUE;
		}
		else
		{
			PrintScreen("Для этого мне нужен кузнечный молот.",-1,6,_STR_FONT_ONSCREEN,_TIME_MESSAGE_PICKLOCK);
			if(!Npc_HasItems(self,itmiswordrawhot))
			{
				CreateInvItems(self,itmiswordrawhot,1);
			};
		};
	}
	else
	{
		if(!Npc_HasItems(self,itmw_1h_sledgehammer_01))
		{
			CreateInvItem(self,itmw_1h_sledgehammer_01);
		};
		return TRUE;
	};	
};

func void bsanvil_s1()
{
	if(Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		AI_Wait(self,7.5);
		b_stopusemob(self,"BSANVIL");
	};
};

func void bsanvil_s0()
{
	if(Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};

func void bscool_s1()
{
	if(Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		AI_Wait(self,8);
		b_stopusemob(self,"BSCOOL");
	};
};

func void bscool_s0()
{
	if(Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};

func void bssharp_s1()
{
	if(Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		AI_Wait(self,7.8);
		b_stopusemob(self,"BSSHARP");
	};
};

func void bssharp_s0()
{
	if(Npc_IsPlayer(self))
	{
		PrintScreen("Меч готов!",-1,10,"FONT_OLD_10_WHITE.TGA",3);
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};

