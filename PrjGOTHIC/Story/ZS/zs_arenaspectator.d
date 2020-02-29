
func void zs_arenaspectator()
{
	occupiedperception();
	AI_GotoWP(self,self.wp);
	AI_GotoFP(self,"STAND");
	AI_AlignToFP(self);
};

func void zs_arenaspectator_loop()
{
};

func void zs_arenaspectator_end()
{
};

