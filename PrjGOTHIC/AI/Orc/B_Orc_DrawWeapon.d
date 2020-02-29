
func void b_orc_drawweapon()
{
	var int att;
	printdebugnpc(PD_ORC_FRAME,"B_Orc_DrawWeapon");
	if(other.guild < GIL_SEPERATOR_ORC)
	{
		printdebugnpc(PD_ORC_FRAME,"B_Orc_DrawWeapon: Ein Nicht-Ork hat die Waffe gezogen!");
		AI_TurnToNPC(self,other);
		if(Hlp_Random(20) < 4)
		{
			b_say(self,other,"$REMOVEYOURWEAPON");
		};
		att = Npc_GetPermAttitude(self,other);
		if(att == ATT_ANGRY)
		{
			Npc_SetTempAttitude(self,ATT_HOSTILE);
		}
		else if(att == ATT_NEUTRAL)
		{
			Npc_SetTempAttitude(self,ATT_ANGRY);
		}
		else if(att == ATT_FRIENDLY)
		{
			Npc_SetTempAttitude(self,ATT_NEUTRAL);
		};
	};
};

