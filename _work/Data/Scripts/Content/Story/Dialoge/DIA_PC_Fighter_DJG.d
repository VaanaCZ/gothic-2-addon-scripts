
// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_GornDJG_EXIT(C_INFO)
{
	npc		= PC_Fighter_DJG;
	nr		= 999;
	condition	= DIA_GornDJG_EXIT_Condition;
	information	= DIA_GornDJG_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_GornDJG_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_GornDJG_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_STARTCAMP		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_STARTCAMP_Condition;
	information	 = 	DIA_GornDJG_STARTCAMP_Info;

	description	 = 	"Veo que te has unido a los cazadores de dragones.";
};

func int DIA_GornDJG_STARTCAMP_Condition ()
{
	if (Npc_GetDistToWP(self,"OW_DJG_STARTCAMP_01")<1000) 				
		{
			return TRUE;
		};
};

func void DIA_GornDJG_STARTCAMP_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_15_00"); //Veo que te has unido a los cazadores de dragones.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_01"); //Seguí a Sylvio hasta el Valle de los Dragones porque conozco mejor la zona y quería hacerme una idea clara de la situación.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_02"); //¿Sabes qué? Desde luego, algo se está tramando. En mi vida he visto tantos orcos en un mismo lugar.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_03"); //A estas alturas, no me sorprendería que Garond y los paladines del castillo hubieran muerto.

	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "Ya nos veremos.", DIA_GornDJG_STARTCAMP_By );
	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "¿Qué piensas hacer ahora?", DIA_GornDJG_STARTCAMP_Wohin );


};
func void DIA_GornDJG_STARTCAMP_Wohin ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_Wohin_15_00"); //¿Qué planes tienes ahora?
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_01"); //Primero seguiré a estos muchachos al Valle de las Minas y luego me largaré.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_02"); //Tengo que averiguar qué traman los orcos.

};

func void DIA_GornDJG_STARTCAMP_By ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_By_15_00"); //Ya nos veremos.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_By_12_01"); //Cuídate.
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_HALLO		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_HALLO_Condition;
	information	 = 	DIA_GornDJG_HALLO_Info;

	description	 = 	"¡Así que aquí te habías escondido!";
};

func int DIA_GornDJG_HALLO_Condition ()
{
	if (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01")<1500) 				
		{
			return TRUE;
		};
};

func void DIA_GornDJG_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_HALLO_15_00"); //¡Así que te escondías aquí!
	AI_Output			(self, other, "DIA_GornDJG_HALLO_12_01"); //No es tan fácil matarte, ¿eh?

};

///////////////////////////////////////////////////////////////////////
//	Info WhatsUp
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WHATSUP		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WHATSUP_Condition;
	information	 = 	DIA_GornDJG_WHATSUP_Info;

	description	 = 	"¿Todavía no has pillado nada?";
};

func int DIA_GornDJG_WHATSUP_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_GornDJG_HALLO))
		{
				return TRUE;
		};
};

func void DIA_GornDJG_WHATSUP_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_15_00"); //¿Todavía no has pillado nada?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_12_01"); //Sigo esperando. Creo que puede haber algo en las viejas ruinas de las rocas. De noche se ven luces y se oyen gritos.

	Info_ClearChoices	(DIA_GornDJG_WHATSUP);
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "¿Quizá Lester?", DIA_GornDJG_WHATSUP_Lester );
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "¿Un dragón?", DIA_GornDJG_WHATSUP_A_Dragon );
	
	B_LogEntry (TOPIC_Dragonhunter,"Gorn está al pie de la meseta junto a la antigua fortaleza rocosa. Desde allí puede vigilar tanto la meseta como la barrera de los orcos."); 
};
func void DIA_GornDJG_WHATSUP_Lester ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_Lester_15_00"); //A lo mejor Lester ha vuelto a sus antiguas ruinas en las rocas.
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_Lester_12_01"); //Es imposible. Según tengo entendido, Lester ya no vive ahí arriba.
};

func void DIA_GornDJG_WHATSUP_A_Dragon ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_A_Dragon_15_00"); //¿Un dragón?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_01"); //Es muy probable. La meseta está igual de vigilada que si fuera el maldito tesoro del rey. Por desgracia, es el único camino que lleva a la fortaleza.
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_02"); //Por si no tuviéramos poco con los dragones. Parece que llevan a la zaga a unos cuantos monstruos más.

	GornDJG_WhatMonsters = TRUE;

	B_LogEntry (TOPIC_Dragonhunter,"Según Gorn, hay un dragón en la vieja fortaleza rocosa."); 
	
	Info_ClearChoices	(DIA_GornDJG_WHATSUP);
};

///////////////////////////////////////////////////////////////////////
//	Info WhatMonsters
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WHATMONSTERS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WHATMONSTERS_Condition;
	information	 = 	DIA_GornDJG_WHATMONSTERS_Info;

	description	 = 	"¿Qué tipo de monstruos serían?";
};

func int DIA_GornDJG_WHATMONSTERS_Condition ()
{
	if (GornDJG_WhatMonsters == TRUE)
		{
				return TRUE;
		};
};

func void DIA_GornDJG_WHATMONSTERS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATMONSTERS_15_00"); //¿Qué tipo de monstruos son?
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_01"); //No pude distinguirlos bien, pero caminan erguidos y tienen piel escamosa. Se mueven por las rocas como chasqueadores que han captado el rastro de una presa.
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_02"); //Desde aquí les oigo resollar y bufar. Creo que se han apoderado de toda la meseta.

};


///////////////////////////////////////////////////////////////////////
//	Info WahtAboutOrcs
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WAHTABOUTORCS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WAHTABOUTORCS_Condition;
	information	 = 	DIA_GornDJG_WAHTABOUTORCS_Info;

	description	 = 	"¿Qué hay de los orcos?";
};

func int DIA_GornDJG_WAHTABOUTORCS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_GornDJG_HALLO))
		{
				return TRUE;
		};
};

func void DIA_GornDJG_WAHTABOUTORCS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_00"); //¿Qué hay de los orcos?
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_01"); //Llevo vigilándolos bastante tiempo. La barricada que han erigido debe de ocultar algo. Sospecho que se congregan en tropel ahí detrás.
	AI_Output			(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_02"); //¿Aún MÁS de los que ya hay por aquí?
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_03"); //No me sorprendería que una noche derribaran la empalizada e invadieran el país. Esto me da mala espina.
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_04"); //Si eso ocurre, tendré que volver y advertir a Lee. De todos modos, quiere marcharse de la isla. Para entonces, será el momento adecuado.

};

///////////////////////////////////////////////////////////////////////
//	Info HelpKillDraconians
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_HELPKILLDRACONIANS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Condition;
	information	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Info;

	description	 = 	"¿Puedes ayudarme a llegar hasta la fortaleza?";
};

func int DIA_GornDJG_HELPKILLDRACONIANS_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_GornDJG_WHATMONSTERS))
		&& (Npc_KnowsInfo(other, DIA_GornDJG_WAHTABOUTORCS))
		&& ((Npc_IsDead(RockDragon))== FALSE)
		)
			{
					return TRUE;
			};
};

func void DIA_GornDJG_HELPKILLDRACONIANS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_00"); //¿Puedes ayudarme a llegar hasta la fortaleza?
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_01"); //La verdad es que lo no sé. Tengo miedo de que los orcos ataquen en cuanto aparte la vista.
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_02"); //¡Estás paranoico!
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_03"); //No puedo evitarlo. Si llegara tarde, nunca me lo perdonaría, ¿comprendes? Por otro lado...
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_04"); //¡Lo que nos faltaba! ¿Por qué estoy aquí? Ataquemos la meseta y abrámonos paso por la fuerza hasta la fortaleza.
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_05"); //Un poco de ejercicio nunca viene mal. Además, quiero echar un vistazo de cerca a las bestias de ahí arriba.
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_06"); //¡Avísame cuando estés listo!

	B_LogEntry (TOPIC_Dragonhunter,"Gorn quiere ayudarme a llegar hasta la fortaleza de roca que domina la meseta."); 

};

///////////////////////////////////////////////////////////////////////
//	Info LosGeht´s
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_LOSGEHTS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_LOSGEHTS_Condition;
	information	 = 	DIA_GornDJG_LOSGEHTS_Info;

	description	 = 	"¡Ataquemos!";
};

func int DIA_GornDJG_LOSGEHTS_Condition ()
{
if (Npc_KnowsInfo(other, DIA_GornDJG_HELPKILLDRACONIANS))
		{
				return TRUE;
		};
};

func void DIA_GornDJG_LOSGEHTS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_LOSGEHTS_15_00"); //¡Ataquemos!
	AI_Output			(self, other, "DIA_GornDJG_LOSGEHTS_12_01"); //Como en los viejos tiempos, ¿eh? Pero te advierto una cosa: ésta es mi batalla. ¡Esta vez voy yo en vanguardia!

	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"RunToRockRuinBridge"); 
};




///////////////////////////////////////////////////////////////////////
//	Info BisHierhin
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_BISHIERHIN		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_BISHIERHIN_Condition;
	information	 = 	DIA_GornDJG_BISHIERHIN_Info;
	important	 = 	TRUE;
};

func int DIA_GornDJG_BISHIERHIN_Condition ()
{
	if (Npc_GetDistToWP(self,"LOCATION_19_01")<1000) 				
		{
			return TRUE;
		};
};

func void DIA_GornDJG_BISHIERHIN_Info ()
{
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_00"); //Ha sido pan comido. Amigo mío, tú tendrás que ocuparte del resto. ¡Pónselo difícil! Volveré a vigilar a los orcos.
	AI_Output			(other, self, "DIA_GornDJG_BISHIERHIN_15_01"); //No hay problema. ¡Nos vemos!
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_02"); //¡Eso espero!

	B_LogEntry (TOPIC_Dragonhunter,"Gorn ha vuelto a su puesto de observación. Quiere seguir vigilando a los orcos."); 

	B_GivePlayerXP (XP_GornDJGPlateauClear);
 	
 	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info DragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_DRAGONDEAD		(C_INFO)
{
	npc		 	 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_DRAGONDEAD_Condition;
	information	 = 	DIA_GornDJG_DRAGONDEAD_Info;

	description	 = 	"¡El dragón de roca está muerto!";	
};

func int DIA_GornDJG_DRAGONDEAD_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_GornDJG_WHATSUP))
		&& (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01")<1000)
		&&  ((Npc_IsDead(RockDragon))== TRUE)
		)
		{
				return TRUE;
		};
};

func void DIA_GornDJG_DRAGONDEAD_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_00"); //¡El dragón de roca está muerto!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_01"); //¡Ya no oigo gritos! ¿Estabas en la fortaleza rocosa?
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_02"); //¡Sí!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_03"); //¡Ja, ja! Ya me parecía. Dondequiera que apareces, no queda una sola piedra en pie.
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_04"); //¿Qué vas a hacer ahora?
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_05"); //Me quedaré por aquí un tiempo y luego volveré con Lee. ¡A lo mejor volvemos a vernos allí!
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_06"); //Me estoy hartando de esta zona. Ya es hora de que nos larguemos de este país.
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_07"); //¡Hasta luego!
	B_GivePlayerXP (XP_Ambient);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fighter_DJG_PICKPOCKET (C_INFO)
{
	npc			= PC_Fighter_DJG;
	nr			= 900;
	condition	= DIA_Fighter_DJG_PICKPOCKET_Condition;
	information	= DIA_Fighter_DJG_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Fighter_DJG_PICKPOCKET_Condition()
{
	C_Beklauen (10, 35);
};
 
FUNC VOID DIA_Fighter_DJG_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fighter_DJG_PICKPOCKET);
	Info_AddChoice		(DIA_Fighter_DJG_PICKPOCKET, DIALOG_BACK 		,DIA_Fighter_DJG_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fighter_DJG_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fighter_DJG_PICKPOCKET_DoIt);
};

func void DIA_Fighter_DJG_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fighter_DJG_PICKPOCKET);
};
	
func void DIA_Fighter_DJG_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fighter_DJG_PICKPOCKET);
};











