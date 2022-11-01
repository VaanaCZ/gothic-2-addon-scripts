// ***************************************************
//  	B_AssignSchiffswachenTalk	
// ***************************************************
func void B_AssignSchiffswachenGuard (var C_NPC Schiffswache)
{	
	if 	((MIS_ShipIsFree == TRUE)		//Joly: SC darf jetzt auf´s Schiff!!!!
	||	(MIS_SCVisitShip == LOG_RUNNING))//Joly: Für die Kurzzeitige Erlaubnis, das Schiff zu besuchen! Muß nach der Aktion wieder geändert werden, z. B = 0;
	{
			if (Schiffswache.voice == 4)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_Ambient_04_00"); //Recuerda que estamos pendientes de ti.
			};
			if (Schiffswache.voice == 9)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_Ambient_09_01"); //No te metas en líos mientras estés aquí.
			};
			if (Schiffswache.voice == 12)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_Ambient_12_02"); //Ni se te ocurra robar nada, ¿te enteras?
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
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_00"); //Los malditos orcos han atacado el castillo de Garond. Tenemos que actuar de inmediato.
			};
			if (Schiffswache.voice == 9)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_01"); //Como cojamos al traidor que abrió la puerta principal del castillo, nos lo cargamos.
			};
			if (Schiffswache.voice == 12)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_02"); //No podemos esperar mucho más. Los muchachos del Valle de las Minas necesitan nuestra ayuda antes de que ataque la siguiente oleada de orcos.
			};
		}
	else
		{
			if (Schiffswache.voice == 4)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_03"); //Garond ha ordenado una movilización general. No tardaremos en ir al Valle de las Minas.
			};
			if (Schiffswache.voice == 9)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_04"); //Los orcos por fin van a recibir su merecido.
			};
			if (Schiffswache.voice == 12)
			{
				AI_Output (self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_05"); //Tengo muchas ganas de dar un escarmiento a los orcos. Ya queda poco.
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
