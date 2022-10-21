var int RavenBlitz;

func void B_BeliarsWeaponSpecialDamage (var C_NPC oth, var C_NPC slf) //other ist angreifer, slf ist victim
{
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Raven)) //HACK: egal, welche Waffe Raven hat
	{
		//Ambient Pfx
		Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE", slf, slf, 0, 0, 0, FALSE );
			
			if (RavenBlitz <= 0)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",  oth, oth, 0, 0, 0, FALSE );
								
				B_MagicHurtNpc (slf, oth, 50); //Extraschaden von Raven!
				
				RavenBlitz += 1;
			}
			else if (RavenBlitz >= 3) 
			{
				var int RavenRandy; RavenRandy = Hlp_Random(3);
				if (RavenRandy <= 50)
				{
					RavenBlitz = 0; //wieder von vorne
				};
			}
			else
			{
				RavenBlitz += 1;
			};
			
	}
	else if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(hero))
	{
		var int DamageRandy;
		DamageRandy = Hlp_Random (100);

		if (C_ScHasReadiedBeliarsWeapon())
		&& (DamageRandy <= BeliarDamageChance) 
			{
				if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD) //beim untoten Drachen nimmt der SC Schaden
				{
					Wld_PlayEffect("spellFX_BELIARSRAGE", oth, oth, 0, 0, 0, FALSE );
					B_MagicHurtNpc (slf, oth, 100); 
				}
				else if (slf.flags != NPC_FLAG_IMMORTAL)
				{
					Wld_PlayEffect("spellFX_BELIARSRAGE", slf, slf, 0, 0, 0, FALSE );
					B_MagicHurtNpc (oth, slf, 100);  			
				};
				//Ambient Pfx
				Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE", hero, hero, 0, 0, 0, FALSE );
			};
	
		if (C_ScHasReadiedBeliarsWeapon())
		&& (DamageRandy <= 50) // Effekt
		{
				//Ambient Pfx
				Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE", hero, hero, 0, 0, 0, FALSE );
		};
	};
};
