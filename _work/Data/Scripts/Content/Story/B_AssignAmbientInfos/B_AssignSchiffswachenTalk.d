// ***************************************************
//  	B_AssignSchiffswachenTalk	
// ***************************************************
func void B_AssignSchiffswachenGuard (var C_NPC Schiffswache)
{	
	if 	((MIS_ShipIsFree == TRUE)		//Joly: SC darf jetzt auf�s Schiff!!!!
	||	(MIS_SCVisitShip == LOG_RUNNING))//Joly: F�r die Kurzzeitige Erlaubnis, das Schiff zu besuchen! Mu� nach der Aktion wieder ge�ndert werden, z. B = 0;
	{
			if (Schiffswache.voice == 4)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_Ambient_04_00"); //Ti stiamo tenendo d'occhio. Ricordatelo.
			};
			if (Schiffswache.voice == 9)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_Ambient_09_01"); //Non cacciarti nei guai mentre sei qui.
			};
			if (Schiffswache.voice == 12)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_Ambient_12_02"); //Togliti dalla testa di rubare qualcosa da qui, intesi?
			};
		AI_StopProcessInfos (Schiffswache);
		Npc_SetRefuseTalk 	(Schiffswache,60);
		Npc_SetRefuseTalk 	(Pal_220_Schiffswache,60);//Joly: Damit alle die Schnauze halten, wenn der SC auf dem Schiff rumwandert.
		Npc_SetRefuseTalk 	(Pal_221_Schiffswache,60);
		Npc_SetRefuseTalk 	(Pal_222_Schiffswache,60);
		Npc_SetRefuseTalk 	(Pal_223_Schiffswache,60);
		Npc_SetRefuseTalk 	(Pal_224_Schiffswache,60);
		Npc_SetRefuseTalk 	(Pal_225_Schiffswache,60);
		Npc_SetRefuseTalk 	(Pal_226_Schiffswache,60);
		Npc_SetRefuseTalk 	(Pal_227_Schiffswache,60);
		Npc_SetRefuseTalk 	(Pal_228_Schiffswache,60);
	}
	else
	{
		B_Say (self, other, "$ALARM"); 
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_GuardStopsIntruder, 1);//Joly: Ohne Erlaubnis hat der SC da nix verloren!!!!!!!!!!!
		Npc_SetRefuseTalk 	(Schiffswache,20);
		Npc_SetRefuseTalk 	(Pal_220_Schiffswache,20);//Joly: Damit alle die Schnauze halten, wenn der SC sich in sicherheit bringen will.
		Npc_SetRefuseTalk 	(Pal_221_Schiffswache,20);
		Npc_SetRefuseTalk 	(Pal_222_Schiffswache,20);
		Npc_SetRefuseTalk 	(Pal_223_Schiffswache,20);
		Npc_SetRefuseTalk 	(Pal_224_Schiffswache,20);
		Npc_SetRefuseTalk 	(Pal_225_Schiffswache,20);
		Npc_SetRefuseTalk 	(Pal_226_Schiffswache,20);
		Npc_SetRefuseTalk 	(Pal_227_Schiffswache,20);
		Npc_SetRefuseTalk 	(Pal_228_Schiffswache,20);
	};
};

func void B_AssignSchiffswachenInfos (var C_NPC Schiffswache)
{	
	if (Mis_OCGateOpen == TRUE)
		{
			if (Schiffswache.voice == 4)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_00"); //Quei dannati orchi hanno attaccato il castello di Garond. Dobbiamo agire immediatamente.
			};
			if (Schiffswache.voice == 9)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_01"); //Se riusciamo a catturare il traditore che ha aperto il portone principale del castello, gli faremo fare una brutta fine.
			};
			if (Schiffswache.voice == 12)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_02"); //Non possiamo attendere oltre. I nostri uomini nella Valle delle Miniere hanno bisogno d'aiuto prima del prossimo attacco degli orchi.
			};
		}
	else
		{
			if (Schiffswache.voice == 4)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_03"); //Garond ha convocato una mobilitazione generale. Ci dirigeremo presto verso la Valle delle Miniere.
			};
			if (Schiffswache.voice == 9)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_04"); //Dobbiamo dare una lezione agli orchi.
			};
			if (Schiffswache.voice == 12)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_05"); //Non vedo l'ora di dare una lezione a quegli orchi. Partiremo presto.
			};
		};
	AI_StopProcessInfos	(Schiffswache);
};

func void B_AssignSchiffswachenTalk (var C_NPC Schiffswache)
{
	if (Kapitel >= 5)
	{
		B_AssignSchiffswachenInfos (Schiffswache);
	}
	else 
	{
		B_AssignSchiffswachenGuard	(Schiffswache);
	};
};

func int B_AssignSchiffswachenInfoConditions (var C_NPC Schiffswache)
{
	if 	(Kapitel < 5)
	&&	(Npc_RefuseTalk(self) == FALSE)
	&&  (MIS_SCVisitShip != LOG_RUNNING)	
		{
			return TRUE;
		}
	else if	(Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};
