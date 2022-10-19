// ****************************************************************
// B_AssessDamage
// --------------
// wird durchWahrnehmung PERC_AssessDamage ÜBERALL her aufgerufen
// (also auch aus ZS_Attack, AR kann sich allerdings NICHT ändern!)
// ****************************************************************

func void B_AssessDamage ()
{
	var C_NPC Quarho; Quarho = Hlp_GetNpc (NONE_ADDON_111_Quarhodron);
	var C_NPC Rhadem; Rhadem = Hlp_GetNpc (NONE_ADDON_112_Rhademes);

	if	((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Quarho)))
	||	((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rhadem)))
	{
		B_GhostSpecialDamage (other, self);
		return;
	};

	B_BeliarsWeaponSpecialDamage (other, self);

	// AIVARS

	if (self.aivar[AIV_ArenaFight] == AF_AFTER)
	{
		self.aivar[AIV_ArenaFight] = AF_AFTER_PLUS_DAMAGE;
	};
	
	if self.aivar [AIV_EnemyOverride] == TRUE
	{
		var C_NPC RAV; RAV = Hlp_GetNpc(BDT_1090_Addon_Raven);
		
		if (Hlp_GetInstanceID(self) == (Hlp_GetInstanceID(RAV)))
		{
			self.aivar [AIV_EnemyOverride] =	FALSE;
		};
	};
	// ------ Wenn NSC im ZS_Attack ------
	if (Npc_IsInState(self,ZS_Attack))
	{
		// EXIT IF...
		
		// ------ Freunde ignorieren Treffer vom Spieler im Kampf ------
		if (Npc_IsPlayer (other))
		&& (self.npctype == NPCTYPE_FRIEND)
		{
			return;
		};
		
		// ------ Partymember ignorieren Treffer vom Spieler im Kampf ------
		if (Npc_IsPlayer (other))
		&& (self.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			return;
		};
		
		// FUNC
		
		// ------ Wenn ich von jemand ANDEREM getroffen werde ------
		if (Hlp_GetInstanceID (other) != self.aivar[AIV_LASTTARGET])
		{
			// ------ NEUER Angreifer ist NPC ODER zum zweiten MAl (von Hero) getroffen ------
			if (self.aivar[AIV_HitByOtherNpc] == Hlp_GetInstanceID (other))
			|| (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(hero)) 
			{
				Npc_SetTarget (self, other); //Ziel wechseln
			}
			else //NEUER Angreifer ist hero und trifft zum ersten mal
			{
				self.aivar[AIV_HitByOtherNpc] = Hlp_GetInstanceID (other); //EIN Freischlag
			};
		};
			
		return;
	};
	
	
	// EXIT IF
	
	// ------ NSC ist ENEMY ----- 
	if (B_AssessEnemy())
	{
		return;
	};
	
	// ------ Egill/Enim NSCs (Story-Angreifer) ------
	if (!Npc_IsPlayer(other))
	&& (other.aivar[AIV_ATTACKREASON] == AR_NONE)
	{
		B_Attack (self, other, AR_NONE, 0);		//angreifen oder fliehen
		return;
	};
		
	// ------ Spieler hat mit NK-Waffe angegriffen ------
	if (Npc_IsInFightMode (other, FMODE_MELEE))
	|| (Npc_IsInFightMode (other, FMODE_FIST))
	|| (Npc_IsInFightMode (other, FMODE_NONE)) //oder Waffe wieder weggesteckt (nicht ermittelbar)
	{
		// ------ NSC ist freundlich ODER npctype_friend ------
		if (Npc_GetAttitude (self, other) == ATT_FRIENDLY)
		|| ( (self.npctype == NPCTYPE_FRIEND) && Npc_IsPlayer(other) )
		{
			// ------- nur wenn ich zum ERSTEN Mal geschlagen werde -------
			if (!Npc_IsInState(self, ZS_ReactToDamage))
			{
				Npc_ClearAIQueue	(self);
				B_ClearPerceptions	(self);							//schaltet alle Wahrnehmungen ab - so kann keine später priorisierte diesen Stateaufruf verhindern (s. z.B. AssessFightSound + AssessDamage)
				AI_StartState		(self, ZS_ReactToDamage, 0, "");
				return;												//im unterern B_Attack wird ein ClearQueue aufgerufen, der den AI_StartState direkt wieder aus der queue löscht
																	// - sicherheithalber bei allen AI_StartState-Aufrufen return anfügen
			};
		};
	};	
	
	// FUNC
	
	B_Attack (self, other, AR_ReactToDamage, 0);		//angreifen oder fliehen
	return;
};








