// ***************
// B_Say_AttackEnd
// ***************

func void B_Say_AttackEnd()
{
	// ------ Enemy = Mensch oder Monster ------
	if (self.aivar[AIV_ATTACKREASON] == AR_GuildEnemy)
	|| (self.aivar[AIV_ATTACKREASON] == AR_MonsterMurderedHuman)
	{
		if (other.guild < GIL_SEPERATOR_HUM)
		{
			if (!Npc_IsDead (other))
			{
				if (self.aivar[AIV_LASTTARGET] == Hlp_GetInstanceID (other))
				{
					B_Say (self, other, "$KILLENEMY");				//Stirb, Mistkerl!
				}
				else
				{
					B_Say (self, other, "$GOODKILL");				//(ruft) Ja, mach das Schwein fertig! 
				};
			}
			else
			{
				B_Say (self, other, "$ENEMYKILLED");			//Das war's für dich, Penner.
			};
		}
		else
		{
			if (self.aivar[AIV_PARTYMEMBER] == TRUE)
			{
				var int rnd; rnd = Hlp_Random(100);
				if (rnd > 15)
				&& (other.guild != GIL_DRAGON)
				{
					return;
				};
			};
			
			if (other.aivar[AIV_KilledByPlayer] == FALSE)
			{
				if (self.voice == 9) //wegen Lares (Addon)
				{
					var int random; random = Hlp_Random(2);
					if (random == 0) 
					{
						B_Say (self, other, "$ADDON_MONSTERKILLED");
					}
					else
					{
						B_Say (self, other, "$ADDON_MONSTERKILLED2");
					};
				}
				else if (self.voice == 12)	//wegen Ali-Jack
				{
					if	((Hlp_GetInstanceID (self) == Hlp_GetInstanceID (GornOW))
					||   (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (GornDJG))
					||   (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (GornNW_vor_DJG))
					||   (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (GornNW_nach_DJG))
					||   (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Gorn_DI)))
					{
						var int randy; randy = Hlp_Random(2);
						if (randy == 0) 
						{
							B_Say (self, other, "$ADDON_MONSTERKILLED");
						}
						else
						{
							B_Say (self, other, "$MONSTERKILLED");
						};
					}
					else
					{
						B_Say (self, other, "$ADDON_MONSTERKILLED");
					};
				}
				else //andere Stimmen
				{
					B_Say (self, other, "$MONSTERKILLED");	//Ein Mistvieh weniger!
				};
			}
			else //Player hat getötet
			{
				B_Say (self, other, "$GOODMONSTERKILL");		
			};
		};
		return;
	};
	
	// ------ Spieler hat Item geklaut ------
	if (self.aivar[AIV_ATTACKREASON] == AR_Theft)
	{
		B_Say (self, other, "$THIEFDOWN");					//Versuch nie wieder mich zu bestehlen!
		return;
	};
	
	// ------ Spieler hat an Mob mit Besitzflag rumgefummelt (kann JEDES Mob sein) ------
	if (self.aivar[AIV_ATTACKREASON] == AR_UseMob)
	{
		B_Say (self, other, "$RUMFUMMLERDOWN");				//Lass in Zukunft die Finger von Sachen, an denen du nichts zu suchen hast!
		return;
	};
	
	// ------ Schaf wurde angegriffen oder getötet (von Mensch oder Monster) ------
	if (self.aivar[AIV_ATTACKREASON] == AR_SheepKiller)
	{
		if (other.guild < GIL_SEPERATOR_HUM)
		{
			B_Say (self, other, "$SHEEPATTACKERDOWN");		//Tu das nie wieder! Das sind unsere Schafe!
		}
		else
		{
			B_Say (self, other, "$MONSTERKILLED"); 			//Ein Mistvieh weniger!
		};
		return;
	};
	
	// ------ Mensch hat Mensch ermordet ------
	if (self.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman)
	{
		if (!Npc_IsDead (other))
		{
			if (self.aivar[AIV_LASTTARGET] == Hlp_GetInstanceID (other))
			{
				B_Say (self, other, "$KILLMURDERER");	//Stirb, Mörder!
			}
			else
			{
				B_Say (self, other, "$GOODKILL");			//(ruft) Ja, mach das Schwein fertig! 
			};
		}
		else
		{
			B_Say (self, other, "$ENEMYKILLED");			//Das war's für dich, Penner.
		};
		return;
	};
	
	// ------ Monster kämpft gegen Human - ich helfe Human ------
	if (self.aivar[AIV_ATTACKREASON] == AR_MonsterVsHuman)
	{
		if (self.voice == 9)	//wegen Lares
		|| (self.voice == 12)	//wegen Ali-Jack und Piraten
		{
			B_Say (self, other, "$ADDON_MONSTERKILLED");				//Ein Mistvieh weniger!
		}
		else
		{
			B_Say (self, other, "$MONSTERKILLED");				//Ein Mistvieh weniger!
		};
		return;
	};
	
	// ------ GateGuards halten nicht-feindliches Monster auf ------
	if (self.aivar[AIV_ATTACKREASON] == AR_MonsterCloseToGate)
	{
		B_Say (self, other, "$STUPIDBEASTKILLED");			//So ein saublödes Vieh!
		return;
	};
	
	// ------ Täter hat mich verletzt ------
	if (self.aivar[AIV_ATTACKREASON] == AR_ReactToDamage)
	{
		B_Say (self, other, "$NEVERHITMEAGAIN"); 			//Leg dich nie wieder mit mir an!
		return;
	};
	
	// ------ Täter hat trotz zweimaliger Warnung Waffe nicht weggesteckt ------
	if (self.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon)
	{
		B_Say (self, other, "$YOUBETTERSHOULDHAVELISTENED");	//Du hättest auf mich hören sollen!
		return;
	};
	
	// ------ Spieler ist unbefugt in meinem Raum ------
	if (self.aivar[AIV_ATTACKREASON] == AR_ClearRoom)
	|| (self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToRoom)
	{
		if (C_NpcIsBotheredByPlayerRoomGuild(self))
		{
			B_Say (self, other, "$GETUPANDBEGONE");				//Und jetzt mach das du hier rauskommst!
		}
		else //SC ist bicht mehr in meinem Raum
		{
			B_Say (self, other, "$NEVERENTERROOMAGAIN");		//Und daß ich dich nie wieder da drin erwische!
		};
		return;
	};
	
	// ------ Spieler hat (verbotenen) Portalraum verlassen ------
	if (self.aivar[AIV_ATTACKREASON] == AR_LeftPortalRoom)
	{
		B_Say (self, other, "$NEVERENTERROOMAGAIN");		//Und daß ich dich nie wieder da drin erwische!
		return;
	};
	
	// ------ GateGuards attackieren Eindringling ------
	if (self.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder)
	{
		B_Say (self, other, "$KILLENEMY");					//Stirb, Mistkerl!
		return;
	};
	
	// ------ Wache beendet Kampf, greift Täter an ------
	if (self.aivar[AIV_ATTACKREASON] == AR_GuardStopsFight)
	{
		if (other.guild == GIL_SLD)
		|| (other.guild == GIL_DJG)
		{
			//Kein SVM
		}
		else
		{
			B_Say (self, other, "$THEREISNOFIGHTINGHERE");		//Hier wird nicht gekämpft, klar!? Lass dir das eine Lehre sein!
		};
		return;
	};
	
	// ------ Wache zu Dieb gerufen ------
	if (self.aivar[AIV_ATTACKREASON] == AR_GuardCalledToThief)
	{
		B_Say (self, other, "$RUMFUMMLERDOWN");				//Lass in Zukunft die Finger von Sachen, an denen du nichts zu suchen hast!
		return;
	};
	
	// ------ kein Grund ------
	return;
};
