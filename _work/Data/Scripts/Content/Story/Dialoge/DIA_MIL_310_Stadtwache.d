// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Mil_310_Stadtwache_EXIT (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 999;
	condition	= DIA_Mil_310_Stadtwache_EXIT_Condition;
	information	= DIA_Mil_310_Stadtwache_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
         
FUNC INT DIA_Mil_310_Stadtwache_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Mil_310_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string Mil_310_Checkpoint	= "NW_CITY_ENTRANCE_MAIN";	//WP hinter City-Tor vom Spielstart aus!
// -----------------------------------------------------------
	var int MIL_310_Personal_AbsolutionLevel;
	//var int Mil_310_schonmalreingelassen; --> GLOBALS
// -----------------------------------------------------------

instance DIA_Mil_310_Stadtwache_FirstWarn (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 1;
	condition	= DIA_Mil_310_Stadtwache_FirstWarn_Condition;
	information	= DIA_Mil_310_Stadtwache_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Mil_310_Stadtwache_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, Mil_310_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) //wenn CRIME in Stadt bekannt
	&& (B_GetCurrentAbsolutionLevel(self) == MIL_310_Personal_AbsolutionLevel) //und noch nicht bezahlt
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else //CRIME_NONE (oder Sheepkiller) - wenn Crime rehabilitiert, wird hier PASSGATE automatisch wieder auf TRUE gesetzt
	{
		if (Mil_310_schonmalreingelassen == TRUE)
		{
			self.aivar[AIV_PASSGATE] = TRUE;
		};
	};
	
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			)
	&&  (Npc_RefuseTalk(self) 							== FALSE 		))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_FirstWarn_Info()
{
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_00"); //¡ALTO!
		
	// ------ PETZMASTER LIGHT ------
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_01"); //(Suspira) ¿Qué pasa?
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_02"); //¡Sabes de sobra lo que pasa!
	
		if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_03"); //¡En la ciudad te buscan por asesinato!
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_04"); //¡Aquí no queremos ladrones asquerosos!
		};
	
		if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_05"); //¡No necesitamos alborotadores en la ciudad!
		};
	
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_06"); //¿Por qué crees que íbamos a dejarte entrar?
	}
	else // ------ normales Reinkommen ------
	{
		 var C_Item itm; itm = Npc_GetEquippedArmor(other);
		
		// ------ ohne Rüstung ------
		if (Npc_HasEquippedArmor(other) == FALSE)
		&& (hero.guild == GIL_NONE) 
		{
			AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_07"); //¿Qué pasa?
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_08"); //¡No vas a entrar, chaval!
			AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_09"); //¿Por qué no?
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_10"); //¡Aunque tienes pinta de desharrapado, seguro que no causas más que líos!
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_11"); //Ya tenemos suficiente chusma en la ciudad. La gente sin dinero no nos sirve de nada.
			
			Log_CreateTopic (TOPIC_City,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
			B_LogEntry (TOPIC_City,"Si quiero que los guardias de la ciudad me dejen entrar en la ciudad, tengo que parecer adinerado. O eso o encuentro otra forma de entrar.");
		}
 	 	 
 		// ------ als Bauer ------		
		else if (Hlp_IsItem(itm, ItAr_Bau_L) == TRUE)
		|| 		(Hlp_IsItem(itm, ItAr_Bau_M) == TRUE)
		{
			if (self.aivar[AIV_TalkedToPlayer] == TRUE)
			{
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_12"); //¿Qué quieres esta vez?
				AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_13"); //Me manda el granjero.
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_14"); //¿Y? ¿Esta vez al menos tienes una buena razón para venir?
			}
			else //zum ersten Mal da
			{
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_15"); //¿Eres uno de los mozos de la granja de Lobart? ¡No te conozco!
				AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_16"); //No llevo mucho tiempo con Lobart.
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_17"); //¿Qué quieres en la ciudad?
			};
		}
		
		// ------ alle anderen Rüstungen ------
		else 
		{
			AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_18"); //(Con calma) ¿Qué?
			if (hero.guild == GIL_PAL)
			|| (hero.guild == GIL_KDF)
			{
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_19"); //Perdona, pero tenemos órdenes.
				AI_Output (other, self,"DIA_Mil_310_Stadtwache_FirstWarn_15_20"); //¿Intentas detenerme?
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_21"); //Claro que no. Todos los miembros de la iglesia de Innos son bien recibidos.
				
			}
			else
			{
				AI_Output (self, other,"DIA_Mil_310_Stadtwache_FirstWarn_07_22"); //Solo quería echarte un vistazo. Parece que tienes dinero. Puedes pasar.
			};
			self.aivar[AIV_PASSGATE] = TRUE;
			Stadtwache_333.aivar[AIV_PASSGATE] = TRUE; 	//Wache vom anderen Stadttor
			Mil_310_schonmalreingelassen = TRUE;
			B_CheckLog();
			
			AI_StopProcessInfos(self);
		};
	};

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,Mil_310_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Mil_310_Stadtwache_SecondWarn (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 2;
	condition	= DIA_Mil_310_Stadtwache_SecondWarn_Condition;
	information	= DIA_Mil_310_Stadtwache_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Mil_310_Stadtwache_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Mil_310_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_SecondWarn_07_00"); //Nada de trucos. ¡Si das un paso más, te hago pedazos!

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,Mil_310_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Mil_310_Stadtwache_Attack (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 3;
	condition	= DIA_Mil_310_Stadtwache_Attack_Condition;
	information	= DIA_Mil_310_Stadtwache_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Mil_310_Stadtwache_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,Mil_310_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Attack_07_00"); //Tú lo has querido...
	
	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};


// ************************************************************
// 							Bestechung!
// ************************************************************

INSTANCE DIA_Mil_310_Stadtwache_Bribe (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 5;
	condition	= DIA_Mil_310_Stadtwache_Bribe_Condition;
	information	= DIA_Mil_310_Stadtwache_Bribe_Info;
	permanent	= TRUE;
	description	= "Aquí tienes 100 monedas de oro. ¡Déjame pasar!";
};                       

FUNC INT DIA_Mil_310_Stadtwache_Bribe_Condition()
{	
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};
	
func void DIA_Mil_310_Stadtwache_Bribe_Info()
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Bribe_15_00"); //Aquí tienes 100 monedas de oro. ¡Déjame pasar!
	
	if (B_GiveInvItems (other, self, itmi_gold, 100))
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Bribe_07_01"); //(Con avaricia) 100 monedas de oro me parecen bien. En ese caso, entra.
		
		if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
		{
			AI_Output (self, other,"DIA_Mil_310_Stadtwache_Bribe_07_02"); //¡Y ve directo a ver a lord Andre! ¡Si no, la próxima vez tendrás que pagar otras 100 monedas de oro!
		};
		
		self.aivar[AIV_PASSGATE] = TRUE;
		Stadtwache_333.aivar[AIV_PASSGATE] = TRUE; 	//Wache vom anderen Stadttor
		Mil_310_schonmalreingelassen = TRUE;
		B_CheckLog();
		
		// ------ wenn bezahlt, persönliche Absolution erteilen -------
		MIL_310_Personal_AbsolutionLevel = B_GetCurrentAbsolutionLevel(self) + 1;
	}
	else //nicht genug Gold
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Bribe_07_03"); //¡¿Qué?! ¡¿Dónde?! No veo 100 monedas de oro. ¡Lárgate!
	};
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 						Passierschein
// ************************************************************

INSTANCE DIA_Mil_310_Stadtwache_Passierschein (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 4;
	condition	= DIA_Mil_310_Stadtwache_Passierschein_Condition;
	information	= DIA_Mil_310_Stadtwache_Passierschein_Info;
	permanent 	= FALSE;
	description	= "¡Tengo un pase!";
};

FUNC INT DIA_Mil_310_Stadtwache_Passierschein_Condition()
{	
	if (Npc_HasItems (other,ItWr_Passierschein))
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)
	&& (Mil_310_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Mil_310_Stadtwache_Passierschein_Info()
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Passierschein_15_00"); //¡Tengo un pase!
	
	if (Npc_HasEquippedArmor(other) == FALSE) //ohne Rüstung
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Passierschein_07_01"); //¿De veras? ¿Y a quién mataste para conseguirlo, asesino?
		AI_Output (other, self,"DIA_Mil_310_Stadtwache_Passierschein_15_02"); //¿Me vas a dejar pasar o no?
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Passierschein_07_03"); //¡Venga, entra antes de que cambie de idea!
	}
	else
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Passierschein_07_04"); //Parece ser verdadero. Adelante.
	};

	self.aivar[AIV_PASSGATE] = TRUE;
	Stadtwache_333.aivar[AIV_PASSGATE] = TRUE; 	//Wache vom anderen Stadttor
	Mil_310_schonmalreingelassen = TRUE;
	B_CheckLog();
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Will zum Schmied
// ************************************************************

INSTANCE DIA_Mil_310_Stadtwache_ZumSchmied (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 3;
	condition	= DIA_Mil_310_Stadtwache_ZumSchmied_Condition;
	information	= DIA_Mil_310_Stadtwache_ZumSchmied_Info;
	permanent 	= FALSE;
	description	= "Quiero ver al herrero para que me arregle algunas herramientas.";
};

FUNC INT DIA_Mil_310_Stadtwache_ZumSchmied_Condition()
{	
	var C_Item itm; itm = Npc_GetEquippedArmor(other);
	
	if ( (Hlp_IsItem(itm, ItAr_Bau_L) == TRUE) || (Hlp_IsItem(itm, ItAr_Bau_M) == TRUE) )
	&& (Npc_KnowsInfo (other, DIA_Maleth_ToTheCity))
	&& (Mil_310_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Mil_310_Stadtwache_ZumSchmied_Info()
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_00"); //Quiero ver al herrero para que me arregle algunas herramientas.
	
	if (Mil_310_Scheisse_erzaehlt == TRUE)
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_01"); //(Enojado) ¿Ah sí? ¿Y por qué no lo has dicho antes?
		AI_Output (other, self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_02"); //Quería ver cómo reaccionabas.
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_03"); //¡¿Qué?! ¡Vuelve a intentar algo así conmigo y te enseñaré cómo reacciono ante esas cosas, palurdo estúpido!
	}
	else
	{
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_04"); //Bueno, vale, entra.
	};
	
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_05"); //Y si ves a Lobart, dile que alimente bien a sus ovejas, que le iremos a ver dentro de poco. (Risa maliciosa).

	self.aivar[AIV_PASSGATE] = TRUE;
	Stadtwache_333.aivar[AIV_PASSGATE] = TRUE; 	//Wache vom anderen Stadttor
	Mil_310_schonmalreingelassen = TRUE;
	B_CheckLog();
	B_GivePlayerXP (XP_Ambient);
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				Planzen für Constantino
// ************************************************************

INSTANCE DIA_Addon_Mil_310_Stadtwache_Constantino (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 2;
	condition	= DIA_Addon_Mil_310_Stadtwache_Constantino_Condition;
	information	= DIA_Addon_Mil_310_Stadtwache_Constantino_Info;
	permanent 	= TRUE;
	description	= "Le he traído unas hierbas al alquimista Constantino.";
};

FUNC INT DIA_Addon_Mil_310_Stadtwache_Constantino_Condition()
{	
	if (MIS_Addon_Lester_PickForConstantino == LOG_RUNNING)
	&& (Mil_310_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Mil_310_Stadtwache_Constantino_Info()
{
	AI_Output (other, self,"DIA_Addon_Mil_310_Stadtwache_Constantino_15_00"); //Traigo unas hierbas para Constantino, el alquimista.

	if ((Npc_HasItems (other, ItPl_Mana_Herb_01) > 0)
		|| (Npc_HasItems (other, ItPl_Mana_Herb_02) > 0)
		|| (Npc_HasItems (other, ItPl_Mana_Herb_03) > 0)
		|| (Npc_HasItems (other, ItPl_Health_Herb_01) > 0)
		|| (Npc_HasItems (other, ItPl_Health_Herb_02) > 0)
		|| (Npc_HasItems (other, ItPl_Health_Herb_03) > 0)
		|| (Npc_HasItems (other, ItPl_Dex_Herb_01) > 0)
		|| (Npc_HasItems (other, ItPl_Strength_Herb_01) > 0)
		|| (Npc_HasItems (other, ItPl_Speed_Herb_01) > 0)
		|| (Npc_HasItems (other, ItPl_Temp_Herb) > 0)
		|| (Npc_HasItems (other, ItPl_Perm_Herb) > 0)
		|| (Npc_HasItems (other, ItPl_Beet) > 0))
	{
		AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_01"); //(astuto) ¿Sí? Entonces no te importará enseñarme lo que llevas.
		
		if 	((Npc_HasItems (other, ItPl_Mana_Herb_01) >= MinimumPassagePlants)
			|| (Npc_HasItems (other, ItPl_Mana_Herb_02) >= MinimumPassagePlants)
			|| (Npc_HasItems (other, ItPl_Mana_Herb_03) >= MinimumPassagePlants)
			|| (Npc_HasItems (other, ItPl_Health_Herb_01) >= MinimumPassagePlants)
			|| (Npc_HasItems (other, ItPl_Health_Herb_02) >= MinimumPassagePlants)
			|| (Npc_HasItems (other, ItPl_Health_Herb_03) >= MinimumPassagePlants)
			|| (Npc_HasItems (other, ItPl_Dex_Herb_01) >= MinimumPassagePlants)
			|| (Npc_HasItems (other, ItPl_Strength_Herb_01) >= MinimumPassagePlants)
			|| (Npc_HasItems (other, ItPl_Speed_Herb_01) >= MinimumPassagePlants)
			|| (Npc_HasItems (other, ItPl_Temp_Herb) >= MinimumPassagePlants)
			|| (Npc_HasItems (other, ItPl_Perm_Herb) >= MinimumPassagePlants))
		{
			AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_02"); //(aprobando) Mmh. No parece nada malo. Muy bien, entra. Pero no armes revuelo, ¿entendido?

			self.aivar[AIV_PASSGATE] = TRUE;
			Stadtwache_333.aivar[AIV_PASSGATE] = TRUE; 	//Wache vom anderen Stadttor
			Mil_310_schonmalreingelassen = TRUE;
			MIS_Addon_Lester_PickForConstantino = LOG_SUCCESS;
			B_CheckLog();
			B_GivePlayerXP (XP_Addon_PickForConstantino);
			AI_StopProcessInfos (self);
		}
		else 
		{
			AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_03"); //¿Qué? ¿Qué narices es esto?

			if (Npc_HasItems (other, ItPl_Beet) >= MinimumPassagePlants)
			{
				AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_04"); //¿Para qué quiere un alquimista este montón de vegetales extraños? ¿Me tomas el pelo? ¡Piérdete!
			}
			else 
			{
				AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_05"); //No sé mucho de alquimia, pero ¿quién va a querer un manojo de vegetales como este? Buen intento.
			};	
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_06"); //¿Qué hierbas? No llevas hierbas. ¡Largo!
	};

	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Miliz werden
// ************************************************************

INSTANCE DIA_Mil_310_Stadtwache_MilizWerden (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 2;
	condition	= DIA_Mil_310_Stadtwache_MilizWerden_Condition;
	information	= DIA_Mil_310_Stadtwache_MilizWerden_Info;
	permanent 	= FALSE;
	description	= "¡He venido para alistarme en la milicia!";
};

FUNC INT DIA_Mil_310_Stadtwache_MilizWerden_Condition()
{	
	if (Mil_310_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Mil_310_Stadtwache_MilizWerden_Info()
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_MilizWerden_15_00"); //¡He venido para alistarme en la milicia!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_MilizWerden_07_01"); //¡Ésa sí que es buena! Inténtalo en la otra puerta. A lo mejor ellos se lo tragan.
	
	Mil_310_Scheisse_erzaehlt = TRUE;
};

// ************************************************************
// 				Wichtige Nachricht für Paladine
// ************************************************************

INSTANCE DIA_Mil_310_Stadtwache_Paladine (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 1;
	condition	= DIA_Mil_310_Stadtwache_Paladine_Condition;
	information	= DIA_Mil_310_Stadtwache_Paladine_Info;
	permanent 	= FALSE;
	description	= "¡Tengo que ver al jefe de los paladines!";
};

FUNC INT DIA_Mil_310_Stadtwache_Paladine_Condition()
{	
	if (Mil_310_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Mil_310_Stadtwache_Paladine_Info()
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_15_00"); //¡Tengo que ver al jefe de los paladines! ¡Le traigo un mensaje importante!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_07_01"); //¿Ah, sí? ¿Y cuál es ese mensaje tan importante?
	
	Mil_310_Scheisse_erzaehlt = TRUE;
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"¡La ciudad será atacada dentro de poco!",DIA_Mil_310_Stadtwache_Paladine_AttackSoon);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"¡Las huestes del mal están acampadas en el valle de Khorinis!",DIA_Mil_310_Stadtwache_Paladine_EvilArmy);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"¡He venido a por el Ojo de Innos!",DIA_Mil_310_Stadtwache_Paladine_EyeInnos);
};

func void DIA_Mil_310_Stadtwache_Paladine_EyeInnos() //1
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_00"); //¡He venido a por el Ojo de Innos!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_01"); //¿Qué? No tengo ni idea de qué se trata. ¿Qué se supone que es?
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_02"); //Es un artefacto importante.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_03"); //No tienes pinta de mensajero importante. ¿Tienes alguna credencial?
	if (!Npc_HasItems(other, itwr_passierschein) > 0)
	{
		AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_04"); //¡No!
		AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_05"); //¡Entonces no me hagas perder el tiempo!
	};
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
};

func void DIA_Mil_310_Stadtwache_Paladine_EvilArmy() //2 --> weiter
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_15_00"); //¡Las huestes del mal están acampadas en el valle de Khorinis!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_07_01"); //¿En el Valle de las Minas? ¿Vienes desde allí? ¿Has visto al ejército?
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"No, pero me manda alguien que les vio.",DIA_Mil_310_Stadtwache_Paladine_NoSomeone);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"No, pero sé que está encabezado por dragones.",DIA_Mil_310_Stadtwache_Paladine_NoDragons);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Sí. ¡Estuve en el valle de Khorinis y vi unos dragones gigantescos!",DIA_Mil_310_Stadtwache_Paladine_YesDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_AttackSoon() //3 --> weiter
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_15_00"); //¡La ciudad será atacada dentro de poco!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_07_01"); //¿Qué? ¿Por quién? ¿Los orcos? ¿Has visto a nuestro ejército?
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"No, pero me manda alguien que les vio.",DIA_Mil_310_Stadtwache_Paladine_NoSomeone);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"No, pero sé que está encabezado por dragones.",DIA_Mil_310_Stadtwache_Paladine_NoDragons);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Sí. ¡Estuve en el valle de Khorinis y vi unos dragones gigantescos!",DIA_Mil_310_Stadtwache_Paladine_YesDragons);
};
// ------------------------------------------------------------------------
func void DIA_Mil_310_Stadtwache_Paladine_NoDragons() //+1
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_15_00"); //No, pero sé que está encabezado por dragones.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_01"); //¡Sí, claro! Y mi abuela aconseja a los generales orcos.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_02"); //No pensarás que vamos a dejar que le cuentes esa trola a lord Hagen, ¿verdad?
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_03"); //¡Lárgate!
	Player_KnowsLordHagen = TRUE;
	
	AI_StopProcessInfos(self);	
};

func void DIA_Mil_310_Stadtwache_Paladine_NoSomeone() //+2 --> weiter
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_15_00"); //No, pero me manda alguien que les vio.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_07_01"); //(Desconfiado) ¿Quién te manda?
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"No tengo permiso para decírtelo.",DIA_Mil_310_Stadtwache_Paladine_CantTellYou);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Un paladín.",DIA_Mil_310_Stadtwache_Paladine_APaladin);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"Un mago.",DIA_Mil_310_Stadtwache_Paladine_AMage);
};

func void DIA_Mil_310_Stadtwache_Paladine_YesDragons() //+3
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_15_00"); //Sí. ¡Estuve en el valle de Khorinis y vi unos dragones gigantescos!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_01"); //¡Embustero! El desfiladero que lleva hasta el valle está tomado en los dos extremos. ¡Nadie puede pasar por él!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_02"); //¡Largo de aquí!
	
	AI_StopProcessInfos(self);	
};
// -------------------------------------
func void DIA_Mil_310_Stadtwache_Paladine_AMage() //++1
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_00"); //Un mago.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_01"); //¿Tienes noticias de los magos? ¡Entonces seguro que tienes un sello como prueba!.
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_02"); //No.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_03"); //¿Qué? Los magos siempre dan un sello a sus mensajeros.
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_04"); //Este mago no.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_05"); //No te creo. ¡Si de verdad eres mensajero, desembucha las noticias o lárgate!
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"¡Solo puedo dar este mensaje a los paladines!",DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"¡Los dragones van en vanguardia del ejército del mal!",DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_APaladin() //++2 --> weiter
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_APaladin_15_00"); //Un paladín.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_01"); //Um, podría ser. Los paladines vigilan el desfiladero del Valle de las Minas.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_02"); //Dame tu mensaje y te presentaré.
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"¡Solo puedo dar este mensaje a los paladines!",DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"¡Los dragones van en vanguardia del ejército del mal!",DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_CantTellYou() //++3 - k.A.
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_15_00"); //No tengo permiso para decírtelo.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_01"); //¡No te pongas así conmigo, muchacho! Soy miembro de la guardia de la ciudad.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_02"); //Me puedes contar todo. ¿Quién te envía?
};
// -------------------------------------------
func void DIA_Mil_310_Stadtwache_Paladine_DepecheDragons() //+++1
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_15_00"); //¡Los dragones van en vanguardia del ejército del mal!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_01"); //¿Qué? Eso no puede ser... He estado a punto de dejarte entrar.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_02"); //Si llegas a contarle ese cuento a lord Hagen, me habría cortado la cabeza.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_03"); //¡Lárgate!
	Player_KnowsLordHagen = TRUE;	
	
	AI_StopProcessInfos(self);
};

func void DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins() //+++2 --> 2b
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_15_00"); //¡Solo puedo darle este mensaje a los paladines!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_01"); //¡Así no funciona la cosa, muchacho!
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_02"); //Por nada del mundo voy a dejar que veas a lord Hagen si no puedo estar seguro de que no vas a hacerle perder el tiempo.
	Player_KnowsLordHagen = TRUE;
	
	Info_ClearChoices (DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"No. El mensaje es únicamente para los paladines.",DIA_Mil_310_Stadtwache_Paladine_Only2);
	Info_AddChoice    (DIA_Mil_310_Stadtwache_Paladine,"¡Los dragones van en vanguardia del ejército del mal!",DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_Only2() //+++2b
{
	AI_Output (other, self,"DIA_Mil_310_Stadtwache_Paladine_Only2_15_00"); //No. El mensaje es únicamente para los paladines.
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_Paladine_Only2_07_01"); //Entonces aquí acaba tu trayecto, forastero.

	AI_StopProcessInfos(self);	
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE DIA_Mil_310_Stadtwache_PERM (C_INFO)
{
	npc			= Mil_310_Stadtwache;
	nr			= 5;
	condition	= DIA_Mil_310_Stadtwache_PERM_Condition;
	information	= DIA_Mil_310_Stadtwache_PERM_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       

FUNC INT DIA_Mil_310_Stadtwache_PERM_Condition()
{	
	if (self.aivar[AIV_PASSGATE] == TRUE)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
	
func void DIA_Mil_310_Stadtwache_PERM_Info()
{
	AI_Output (self, other,"DIA_Mil_310_Stadtwache_PERM_07_00"); //¡Márchate!
	
	AI_StopProcessInfos (self);
};






































