
func void b_magichurtnpc(var C_NPC attacker,var int damage)
{
	var int effectivedamage;
	printdebugnpc(PD_ZS_FRAME,"B_MagicHurtNpc");
	effectivedamage = damage - self.protection[PROT_MAGIC];
	if(effectivedamage < 0)
	{
		effectivedamage = 0;
	};
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-effectivedamage);
	if(Npc_IsDead(self))
	{
		if(Npc_IsPlayer(attacker) || (c_npcishuman(attacker) && attacker.aivar[AIV_PARTYMEMBER]) || (c_npcismonster(attacker) && attacker.aivar[AIV_MOVINGMOB]))
		{
			b_deathxp();
		};
	};
};

