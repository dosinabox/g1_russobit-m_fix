
func void c_zsinit()
{
	self.aivar[AIV_FIGHTSPEACHFLAG] = 0;
	c_stoplookat(self);
	if(self.aivar[AIV_INVINCIBLE] == TRUE)
	{
		self.aivar[AIV_INVINCIBLE] = FALSE;
		hero.aivar[AIV_INVINCIBLE] = FALSE;
	};
};

func void c_orc_zsinit()
{
	Npc_SetPercTime(self,2);
	self.aivar[AIV_FIGHTSPEACHFLAG] = 0;
};

