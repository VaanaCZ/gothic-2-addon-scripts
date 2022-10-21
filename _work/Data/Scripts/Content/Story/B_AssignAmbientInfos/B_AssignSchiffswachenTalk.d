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
				AI_Output (self,other,"DIA_Pal_Schiffswache_Ambient_04_00"); //Nous vous surveillons. Souvenez-vous-en.
			};
			if (Schiffswache.voice == 9)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_Ambient_09_01"); //Evitez les probl�mes tant que vous serez ici.
			};
			if (Schiffswache.voice == 12)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_Ambient_12_02"); //Ne songez m�me pas � voler quoi que ce soit ici, compris ?
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
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_00"); //Les maudits orques ont envahi le ch�teau de Garond. Nous devons agir.
			};
			if (Schiffswache.voice == 9)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_01"); //Si jamais nous mettons la main sur ce tra�tre qui a ouvert la porte du ch�teau, on en fera qu'une bouch�e.
			};
			if (Schiffswache.voice == 12)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_02"); //On ne peut attendre plus longtemps. Nos hommes de la Vall�e des mines ont besoin de notre aide avant le prochain assaut des orques.
			};
		}
	else
		{
			if (Schiffswache.voice == 4)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_03"); //Garond en appelle � la mobilisation g�n�rale. Nous partons bient�t � la Vall�e des mines.
			};
			if (Schiffswache.voice == 9)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_04"); //Il faut enfin donner une le�on � ces orques.
			};
			if (Schiffswache.voice == 12)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_05"); //Je suis impatient de donner � ces orques ce qu'ils m�ritent. Nous partons bient�t.
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
