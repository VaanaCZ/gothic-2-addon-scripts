//////////////////////////////////////////////////////////////////////////
//	B_MagicHurtNpc
//	==============
//	Verwundet den NSC und berücksichtigt dabei den magischen Rüstschutz
//	'self' ist der Täter, other der zu verwundende NSC
//////////////////////////////////////////////////////////////////////////
func void B_MagicHurtNpc (var C_NPC slf, var C_NPC oth, var int damage)
{
	Npc_ChangeAttribute (oth, ATR_HITPOINTS, -damage);
	
	// ------ XP HIER vergeben (ZS_Dead kennt den other nicht mehr) ------
	if (Npc_IsDead(oth))
	{
		// ------ XP ------
		if ( Npc_IsPlayer(slf) || (slf.aivar[AIV_PARTYMEMBER]==TRUE) )
		&& (oth.aivar[AIV_VictoryXPGiven] == FALSE)
		{
			B_GivePlayerXP (self.level * XP_PER_VICTORY);
			
			oth.aivar[AIV_VictoryXPGiven] = TRUE;
		};
	};
};
