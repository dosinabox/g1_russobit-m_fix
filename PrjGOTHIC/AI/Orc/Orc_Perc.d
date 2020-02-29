
func void orcslaveperc()
{
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_orcslave_assessdamage);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,b_orcslave_quicklook);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_orcslave_quicklook);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,b_orcslave_quicklook);
};

func void orcdefaultperc()
{
	if(self.guild == GIL_ORCSLAVE)
	{
		orcslaveperc();
		return;
	}
	else
	{
		observingperception();
	};
};

func void orcdefaultpercdoing()
{
	if(self.guild == GIL_ORCSLAVE)
	{
		orcslaveperc();
		return;
	}
	else
	{
		occupiedperception();
	};
};

func void orcdeepsleepperc()
{
	if(self.guild == GIL_ORCSLAVE)
	{
		orcslaveperc();
		return;
	}
	else
	{
		deepsleepperception();
	};
};

func void orclightsleepperc()
{
	if(self.guild == GIL_ORCSLAVE)
	{
		orcslaveperc();
		return;
	}
	else
	{
		lightsleepperception();
	};
};

