func int B_GhostSpecialDamage  (var C_NPC oth, var C_NPC slf) //other ist angreifer, slf ist victim
{
	var C_NPC Quarho; Quarho = Hlp_GetNpc (NONE_ADDON_111_Quarhodron);
	var C_NPC Rhadem; Rhadem = Hlp_GetNpc (NONE_ADDON_112_Rhademes);
	var C_NPC her; her = Hlp_GetNpc (PC_HERO);

		if	((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Quarho)))
		||	((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rhadem)))
		{
			Wld_PlayEffect("spellFX_BELIARSRAGE",  oth, oth, 0, 0, 0, FALSE );
	
			if (oth.flags != NPC_FLAG_IMMORTAL)
			{
				if	(Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(her))
				{
					Npc_ChangeAttribute	(oth, ATR_HITPOINTS, -oth.attribute[ATR_HITPOINTS_MAX]);
				}
				else
				{
					GhostAttackWarn = (GhostAttackWarn + 1);
			
					if (GhostAttackWarn < 3)//Joly: darf 2 mal draufhauen auf den Geist!
					{
						oth.attribute[ATR_HITPOINTS] = (oth.attribute[ATR_HITPOINTS]/2);
					}
					else
					{
						if	(Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(her))
						{
							oth.attribute[ATR_HITPOINTS] = 0;
							AI_PlayAni (oth, "T_DEAD");
						};
					};
			};
		};
		return FALSE;
	};
};
