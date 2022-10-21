// **************************************************
// B_MM_AssessEnemy
// ----------------
// Monster nehmen andere Monster und Humans NUR wahr, 
// wenn sie ATT_HOSTILE gesetzt haben
// (oder wenn sie oder ein Freund getroffen werden)
// Beutetiere nehmen Jäger über PERC_ASSESSWARN wahr
// --------------------------------------------------
// Orcs greifen direkt an
// **************************************************

func void B_MM_AssessEnemy ()
{
	// EXIT IF...

	// ------- Drache greift nicht an, wenn SC LaberAmulett hat ------
	if (self.guild == GIL_DRAGON)
	&& (Npc_HasItems (hero, ItMi_InnosEye_Mis) >= 1)
	{
		return;
	}; 
	
	// ------- OVERRIDE für menschliche Enemies ------
	if ((self.aivar[AIV_NoFightParker] == TRUE)	//werden nie angegriffen und greifen auch selbst nicht an.
		|| 	(other.aivar[AIV_NoFightParker] == TRUE))
	{
		return;
	};
	
	// ------- OVERRIDE für menschliche Enemies ------
	if (self.aivar[AIV_EnemyOverride] == TRUE)	//Joly: für Inubis, Skelette in der Krypta und ä.
	&& (other.guild < GIL_SEPERATOR_HUM)
	{
		return;
	};
	
	// ------- TESTMODE: Levelinspektor wird ignoriert ------
	var C_NPC PCL; PCL = Hlp_GetNpc(PC_Levelinspektor);
	if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PCL))
	{
		return;
	};
	
	// ------- Mag-Golem-Lares-Hack ------------
	var C_NPC MGO; MGO = Hlp_GetNpc(MagicGolem);
	var C_NPC LAR; LAR = Hlp_GetNpc(VLK_449_Lares);
	
	if  (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(LAR))
	&&  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(MGO))
	{
		return;
	};
	
	// ------ HACK: Orks nicht in die Burg ------
	if (Npc_GetDistToWP (self, "OC_RAMP_07") <= 500) 
	{
		return;
	};
	
	// ------ SC/NSC im Dialog ignorieren ------
	if (other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		return;
	};
	
	// ------ Opfer im Wasser und ich will nicht ins Wasser ------
	if (C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE))
	&& (self.aivar[AIV_MM_FollowInWater] == FALSE)
	{
		return;
	};
	
	// ------- Monster sollen sich zu Tode stürzen, etc. ------
	if (Npc_GetHeightToNpc(self, other) > PERC_DIST_HEIGHT)
	{
		return;
	};
	
	// ------ Spieler ist in ein Monster verwandelt ------
	// ACHTUNG: NSCs haben noch Perm_Attitude zu verwandeltem Player, die Guild-Attitude overridet (d.h. sie sind i.d.R. neutral), weswegen AssessEnemy nicht greift
	if (Npc_IsPlayer (other))
	&& (other.guild > GIL_SEPERATOR_HUM) 
	{
		if (Wld_GetGuildAttitude(self.guild, other.guild) != ATT_HOSTILE)
		{
			return;
		};
	};
		
	// ------ Monster können nach HINTEN nicht so weit riechen ------
	// --------------------------------------------------------------
	// ------ wenn ich weit riechen kann ------
	if (self.senses_range > PERC_DIST_MONSTER_ACTIVE_MAX)
	{
		// ------ und Feind weit weg ist ------
		if (Npc_GetDistToNpc (self, other) > PERC_DIST_MONSTER_ACTIVE_MAX)
		{
			// ------ und Feind hinter mir ist ------
			if (!Npc_CanSeeNpc(self, other))
			{
				return;
			};
		};
	};
			
	// ------ wenn man sich an mich anschleichen kann ------
	if (self.guild == GIL_ORC)
	|| (self.guild == GIL_FRIENDLY_ORC)
	{
		// ------ und Feind schleicht ------
		if (C_BodyStateContains (other, BS_SNEAK))
		|| (C_BodyStateContains (other, BS_STAND))
		{
			// ------ und Feind hinter mir ist ------
			if (!Npc_CanSeeNpc(self, other))
			{
				return;
			};
		};
	};

	// ------ other hinter Wand ------
	if (!Npc_CanSeeNpcFreeLOS(self,other))
	{
		return;
	};

	// ------ Ich bin ein SUMMONED Monster ------
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		// ------ NpcType_Friend ignorieren ------
		if (other.npctype == NPCTYPE_FRIEND)
		{
			return;
		};
	
		// ------ sonst Enemy IMMER angreifen ------
		Npc_ClearAIQueue	(self);
		Npc_SetTarget		(self, other);
		B_ClearPerceptions	(self);
		AI_StartState 		(self, ZS_MM_Attack, 0, "");
		return;
	};
	
	// ------ Monster greift direkt an ------
	if (self.aivar[AIV_MM_ThreatenBeforeAttack] == FALSE)
	{
		Npc_ClearAIQueue	(self);
		Npc_SetTarget		(self, other);
		B_ClearPerceptions	(self);
		AI_StartState		(self, ZS_MM_Attack, 0, "");
		return;
	};
	
	// ------ in ZS_MM_EatBody - fressendes Monster ignoriert bzw. vertreibt Enemy ------
	if (Npc_IsInState (self, ZS_MM_EatBody))
	{
		// ------ Enemy kommt in die AttackRange (nah) ------
		if (Npc_GetDistToNpc(self, other) <= FIGHT_DIST_MONSTER_ATTACKRANGE) //Stoerenfried ist zu nah an body
		{
			Npc_ClearAIQueue	(self);
			Npc_SetTarget		(self, other);
			B_ClearPerceptions	(self);
			AI_StartState		(self, ZS_MM_Attack, 0, "");
			return;
		};

		return;		
	};
	
	// ------- in ZS_MM_Hunt - wenn in Attack-Range angreifen ------
	if (Npc_IsInState (self, ZS_MM_Hunt))
	{
		if (Npc_GetDistToNpc(self, other) <= FIGHT_DIST_MONSTER_ATTACKRANGE)
		{
			Npc_ClearAIQueue	(self);
			Npc_SetTarget 		(self,other);
			B_ClearPerceptions	(self);
			AI_StartState 		(self, ZS_MM_Attack, 0, "");
			return;
		}
		else
		{
			return;
		};
	};
		
	// ------ Jäger greift Beute immer direkt an ------
	if (C_PredatorFoundPrey(self, other)) 	
	{
		Npc_ClearAIQueue	(self);
		Npc_SetTarget 		(self,other);
		B_ClearPerceptions	(self);
		AI_StartState 		(self, ZS_MM_Hunt, 0, "");
		return;
	};
	
	// ------ Beute flieht vor Jäger (wenn in Droh-Reichweite (Abfrage s.o.) ------
	if (C_PredatorFoundPrey(other, self))
	{
		if (!Npc_IsInState (other, ZS_MM_Hunt))
		&& (Npc_GetDistToNpc (self, other) <= FIGHT_DIST_MONSTER_FLEE)
		{
			Npc_ClearAIQueue	(self);
			Npc_SetTarget 		(self,other);
			B_ClearPerceptions	(self);
			AI_StartState 		(self, ZS_MM_Flee, 0, "");
			return;
		}
		else
		{
			return;
		};
	};
	

	// FUNC

	// ------ Feind bedrohen & wenn zu nah: angeifen ------
	Npc_ClearAIQueue	(self);
	B_ClearPerceptions	(self);
	AI_StartState 		(self, ZS_MM_ThreatenEnemy, 0, "");
	return;
};
