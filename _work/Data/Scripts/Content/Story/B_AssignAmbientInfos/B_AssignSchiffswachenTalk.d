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
				AI_Output (self,other,"DIA_Pal_Schiffswache_Ambient_04_00"); //Sledujeme t�. Nezapom�nej na to.
			};
			if (Schiffswache.voice == 9)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_Ambient_09_01"); //Dokud jsi tady, ned�lej ��dn� pot�e.
			};
			if (Schiffswache.voice == 12)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_Ambient_12_02"); //Ani nepomysli na to, �e bys tu mohl n�co ukr�st, jasn�?
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
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_00"); //Ti zatracen� sk�eti vzali �tokem Garond�v hrad. Mus�me jednat rychle.
			};
			if (Schiffswache.voice == 9)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_01"); //Kdybychom chytili toho zr�dce, co otev�el hlavn� br�nu do hradu, ud�lali bychom s n�m kr�tk� proces.
			};
			if (Schiffswache.voice == 12)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_02"); //U� nem��eme d�le �ekat. Chlapi v Hornick�m �dol� pot�ebuj� na�i pomoc d��v, ne� za�to�� dal�� vlna.
			};
		}
	else
		{
			if (Schiffswache.voice == 4)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_03"); //Garond ��d� �plnou mobilizaci. Do Hornick�ho �dol� se vyd�me co nevid�t.
			};
			if (Schiffswache.voice == 9)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_04"); //Sk�eti mus� dostat po��dnou lekci.
			};
			if (Schiffswache.voice == 12)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_05"); //Nem��u se do�kat, a� t�m sk�et�m d�me co proto. Za�neme u� brzo.
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
