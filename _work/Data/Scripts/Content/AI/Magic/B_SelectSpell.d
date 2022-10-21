// *************************************************************
// B_SelectSpell
// -------------
// Magieauswahl für Menschen und Monster
// Wenn Auswahlkriterien erfüllt (je nach Gilde unterschiedlich)
// --> TRUE, sonst FALSE
// Humans zaubern nur als KdF, PAL oder DMT
// *************************************************************

func int B_SelectSpell (var C_NPC slf, var C_NPC oth)
{	
	// ------ Npctype_Friend macht höchstens Sleep ------
	if (slf.npctype == NPCTYPE_FRIEND)
	&& (Npc_IsPlayer (oth))
	&& (oth.guild < GIL_SEPERATOR_HUM) //nicht gegen verwandelten Spieler
	{
		if (slf.guild == GIL_KDF)
		|| (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS)
		{
			if (Npc_HasItems (slf, ItRu_Sleep) == 0)
			{
				CreateInvItems (slf, ItRu_Sleep, 1);
			};
		
			B_ReadySpell (slf, SPL_Sleep, SPL_Cost_Sleep);
			return TRUE;
		}
		else //Nicht-KdF
		{
			return FALSE;
		};
	};

	// ------ Dementor -------
	if (slf.guild == GIL_DMT)
	&& (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS)	//Joly: "Mario und seine Freunde", Besessene Menschen (GIL_DMT) mit Nahkampfwaffen.
	{
			// ------- in die Taschen -------
			if (Npc_HasItems (slf, ItRu_InstantFireball) == 0)	{	CreateInvItems (slf, ItRu_InstantFireball, 1);	};
			if (Npc_HasItems (slf, ItRu_Deathbolt) == 0) 		{	CreateInvItems (slf, ItRu_Deathbolt, 1); };
			if (Npc_HasItems (slf, ItRu_Deathball) == 0) 		{	CreateInvItems (slf, ItRu_Deathball, 1); };
			if (Npc_HasItems (slf, ItRu_Firerain) == 0) 		{	CreateInvItems (slf, ItRu_Firerain, 1); };
			if (Npc_HasItems (slf, ItRu_Thunderstorm) == 0) 	{	CreateInvItems (slf, ItRu_Thunderstorm, 1); };
			if (Npc_HasItems (slf, ItRu_LightningFlash) == 0) 	{	CreateInvItems (slf, ItRu_LightningFlash, 1); };
			if (Npc_HasItems (slf, ItRu_Firestorm) == 0) 		{	CreateInvItems (slf, ItRu_Firestorm, 1); };
			if (Npc_HasItems (slf, ItRu_Skull) == 0) 			{	CreateInvItems (slf, ItRu_Skull, 1); };
						
			// ------------------------------
		
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_1299_OberDementor_DI))
		{
			B_ReadySpell (slf, SPL_Skull, SPL_Cost_Skull);
			return TRUE;
		}
		else //alle anderen Dementoren 
		{
			if (Npc_IsDrawingWeapon(slf)) 
			{
				return TRUE;	// nichts tun wenn gerade am waffe ziehen
			};
		
			// ------ Random für eine Serie ------
			if (slf.aivar[AIV_SelectSpell] <= 0)
			{
				var int dK_rnd; dK_rnd = Hlp_Random(10);
				slf.aivar[AIV_SelectSpell] += dK_rnd; //+ 0-9
			};
			
			if (slf.aivar[AIV_SelectSpell] < 10)
			{
				if 		(Kapitel <= 3)	{	B_ReadySpell (slf, SPL_InstantFireball , SPL_Cost_InstantFireball); return TRUE; }
				else if (Kapitel <= 4)	{	B_ReadySpell (slf, SPL_DeathBolt , SPL_Cost_DeathBolt);				return TRUE; }
				else /*Kap 5+*/			{	B_ReadySpell (slf, SPL_DeathBall , SPL_Cost_DeathBall);				return TRUE; };
			}
			else if (slf.aivar[AIV_SelectSpell] == 10)
			{	
				slf.aivar[AIV_SelectSpell] = 11; 		// damit er nicht nochmal hier reinkommt
				
				var int dK_Mega; dK_Mega = Hlp_Random(100);
				if 		(dK_Mega <= 2)	{	B_ReadySpell (slf, SPL_Firerain , SPL_Cost_Firerain); 				return TRUE; }
				else if (dK_Mega <= 5)	{	B_ReadySpell (slf, SPL_Thunderstorm, SPL_Cost_Thunderstorm);		return TRUE; }
				else if (dK_Mega <= 10)	{	B_ReadySpell (slf, SPL_LightningFlash, SPL_Cost_LightningFlash);	return TRUE; }
				else /*11-99*/			{	B_ReadySpell (slf, SPL_Firestorm, SPL_Cost_Firestorm);				return TRUE; };
			}
			else if (slf.aivar[AIV_SelectSpell] == 12)	// neuer spell erst wenn der alte abgeschossen wurde
			{	
				slf.aivar[AIV_SelectSpell]=0;
			};
		};
		
		return TRUE;		// hier immer TRUE zurückgeben, ansonsten wird in B_SelectWeapon die Waffe wieder weggesteckt
	};

	// ------ Magier ------
	if (slf.guild == GIL_KDF)
	|| (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS)
	{
		if (Npc_HasItems (slf, ItRu_Concussionbolt) == 0)
		{
			CreateInvItems (slf, ItRu_Concussionbolt, 1);
		};
		
		if (Npc_HasItems (slf, ItRu_InstantFireBall) == 0)
		{
			CreateInvItems (slf, ItRu_InstantFireBall, 1);
		};
		
		if (Npc_HasItems (slf, ItRu_Deathball) == 0)
		{
			CreateInvItems (slf, ItRu_Deathball, 1);
		};
		
		if (Npc_HasItems (slf, ItRu_FullHeal) == 0)
		{
			CreateInvItems (slf, ItRu_FullHeal, 1);
		};
		
		if (self.attribute[ATR_HITPOINTS] < 100) 
		{
			B_ReadySpell (slf, SPL_FullHeal, SPL_Cost_FullHeal);
			return TRUE;
		}
		else if (C_NpcHasAttackReasonToKill (self))
		{
			if (self.flags == NPC_FLAG_IMMORTAL)
			|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Raven))
			{
				B_ReadySpell (slf, SPL_Deathball, SPL_Cost_Deathball);
			}
			else
			{
				B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireBall);
			};
			return TRUE;
		}
		else
		{
			B_ReadySpell (slf, SPL_Concussionbolt, SPL_Cost_Concussionbolt);
			return TRUE;
		};
	};
	
	// ------ Paladin ------
	if (slf.guild == GIL_PAL)
	{
		if (slf.fight_tactic == FAI_NAILED) //AL-Burgwachen auf den Zinnen
		{
			return FALSE;
		};
			
		if (Npc_HasItems (slf, ItRu_PalHolyBolt) == 0)
		{
			CreateInvItems (slf, ItRu_PalHolyBolt, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		&& (C_NpcIsEvil(oth))
		{
			B_ReadySpell (slf, SPL_PalHolyBolt, SPL_Cost_PalHolyBolt);
			return TRUE;
		}
		else
		{
			return FALSE; //Angriff mit Waffen
		};
	};
	
	// ------ Skelett Magier ------
	if (slf.guild == GIL_SKELETON_MAGE)
	{
		if (Npc_HasItems (slf, ItRu_SumSkel) == 0)
		{
			CreateInvItems (slf, ItRu_SumSkel, 1);
		};
		
		if (Npc_HasItems (slf, ItRu_IceCube) == 0)
		{
			CreateInvItems (slf, ItRu_IceCube, 1);
		};
		
		if (Npc_HasItems (slf, ItRu_Icebolt) == 0)
		{
			CreateInvItems (slf, ItRu_Icebolt, 1);
		};
		
			// ------ Spruchzyklus bei SUMMON beginnen ------
			if (slf.aivar[AIV_SelectSpell] >= 6)
			{
				slf.aivar[AIV_SelectSpell] = 1;
			};
		
		if (!Npc_IsInState (oth, ZS_MagicFreeze))
		&& (slf.aivar[AIV_SelectSpell] == 0)
		{
			B_ReadySpell (slf, SPL_IceCube,	SPL_Cost_IceCube);
			return TRUE;
		}
		else if (slf.aivar[AIV_SelectSpell] == 1)
		{
			B_ReadySpell (slf, SPL_SummonSkeleton, SPL_Cost_SummonSkeleton);
			return TRUE;
		}
		else
		{
			B_ReadySpell (slf, SPL_Icebolt, SPL_Cost_Icebolt);
			return TRUE;
		};
	};
	
	// ------ Eisgolem ------
	if (slf.guild == GIL_ICEGOLEM)
	{
		if (Npc_HasItems (slf, ItRu_IceCube) == 0)
		{
			CreateInvItems (slf, ItRu_IceCube, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) < FIGHT_DIST_MELEE) 
		|| (Npc_IsInState (oth, ZS_MagicFreeze))								
		{
			return FALSE; //Nahkampfangriff
		}
		else
		{
			B_ReadySpell (slf, SPL_IceCube,	SPL_Cost_IceCube);
			return TRUE;
			
		};
	};
	
	// ------ Feuergolem ------
	if (slf.guild == GIL_FIREGOLEM)
	{
		if (Npc_HasItems (slf, ItRu_InstantFireball) == 0)
		{
			CreateInvItems (slf, ItRu_InstantFireball, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			B_ReadySpell (slf, SPL_InstantFireball,	SPL_Cost_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE; //Nahkampfangriff
		};
	};
	

	// ------ Sumpfdrache ------
	if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_SWAMP)
	{
		if (Npc_HasItems (slf, ItRu_InstantFireball) == 0)
		{
			CreateInvItems (slf, ItRu_InstantFireball, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE; //Nahkampfangriff
		};
	};
	
	// ------ Felsdrache ------
	if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ROCK)
	{
		if (Npc_HasItems (slf, ItRu_InstantFireball) == 0)
		{
			CreateInvItems (slf, ItRu_InstantFireball, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE; //Nahkampfangriff
		};
	};
	
	// ------ Feuerdrache ------
	if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE)
	{
		if (Npc_HasItems (slf, ItRu_InstantFireball) == 0)
		{
			CreateInvItems (slf, ItRu_InstantFireball, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE; //Nahkampfangriff
		};
	};
	
	// ------ Eisdrache ------
	if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE)
	{
		if (Npc_HasItems (slf, ItRu_InstantFireball) == 0)
		{
			CreateInvItems (slf, ItRu_InstantFireball, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE; //Nahkampfangriff
		};
	};
	
	// ------ Untoter Drache (ENDGEGNER) ------
	if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
	{
		Npc_ClearAIQueue(self);
		if (Npc_HasItems (slf, ItRu_Deathball) == 0)
		{
			CreateInvItems (slf, ItRu_Deathball, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell (slf, SPL_Deathball, SPL_Cost_Deathball);	
			return TRUE;
		}
		else
		{
			return FALSE; //Nahkampfangriff
		};
	};
	
	// ------ Ork Schamane ------
	if (slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN)
	{
		if (Npc_HasItems (slf, ItRu_InstantFireball) == 0)
		{
			CreateInvItems (slf, ItRu_InstantFireball, 1);
		};
				
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE; //Nahkampfangriff
		};
	};
	
	return FALSE; //alle anderen Gilden		
};   
