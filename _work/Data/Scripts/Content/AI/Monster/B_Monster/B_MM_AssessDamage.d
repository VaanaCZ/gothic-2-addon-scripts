// *****************
// B_MM_AssessDamage
// *****************

func void B_MM_AssessDamage ()
{
	self.aivar[AIV_MM_PRIORITY] = PRIO_ATTACK;

	B_BeliarsWeaponSpecialDamage (other, self);

	// EXIT IF
	
	// ------ SONDERFALL: Magic Golem ------ 				//JUUUUNGEEEEE!!!
	if (Npc_HasItems (other, Holy_Hammer_MIS) > 0)
	{
		var C_NPC MagGol; MagGol = Hlp_GetNpc(MagicGolem);
		Npc_GetInvItem(other, Holy_Hammer_MIS); //befüllt 'item'
		var C_ITEM OthWeap; OthWeap = Npc_GetReadiedWeapon(other);
		
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(MagGol))
		&& (Hlp_GetInstanceID(OthWeap) == Hlp_GetInstanceID(item))
		{
			Npc_ChangeAttribute (self, ATR_HITPOINTS, -1000);
			return;
		};
	};		
	
	if (self.guild == GIL_STONEGUARDIAN)
	&& (self.aivar[AIV_EnemyOverride] == TRUE)
	{
		B_AWAKE_STONEGUARDIAN (self);
	};	
	
	// ----- wenn Monster Beute von Angreifer ------
	if (C_PredatorFoundPrey(other,self))
	{
		Npc_ClearAIQueue	(self);
		Npc_SetTarget 		(self, other);
		B_ClearPerceptions	(self);
		AI_StartState 		(self, ZS_MM_Flee, 0, "");	
		return;
	};

	// ------ wenn Monster im ZS_Attack ------
	if (Npc_IsInState(self,ZS_MM_Attack))
	{
		// EXIT IF...
	
		// ------ Partymember ignorieren Treffer vom Spieler im Kampf ------
		if (Npc_IsPlayer (other))
		&& (self.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			return;
		};
		
		// ------ HACK: von Skelettmagier getroffene Skelette ignorieren Schaden ------
		if (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON)
		&& (other.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE)
		{
			return;
		};
		
		
		// FUNC
		
		// ------ Wenn ich von jemand ANDEREM getroffen werde ------
		if (Hlp_GetInstanceID (other) != self.aivar[AIV_LASTTARGET])
		{
			if (self.aivar[AIV_HitByOtherNpc] == Hlp_GetInstanceID (other))
			{
				Npc_SetTarget (self, other); //Ziel wechseln, wenn zum zweiten Mal getroffen
			}
			else
			{
				self.aivar[AIV_HitByOtherNpc] = Hlp_GetInstanceID (other); //EIN Freischlag
			};
		};
			
		return;
	};
	
	
	// FUNC
	
	Npc_ClearAIQueue	(self);
	Npc_SetTarget		(self, other);
	B_ClearPerceptions	(self);
	AI_StartState		(self, ZS_MM_Attack, 0, "");
	return;
};


