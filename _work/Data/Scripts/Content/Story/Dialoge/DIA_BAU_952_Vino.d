///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Vino_EXIT   (C_INFO)
{
	npc         = BAU_952_Vino;
	nr          = 999;
	condition   = DIA_Vino_EXIT_Condition;
	information = DIA_Vino_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Vino_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Vino_EXIT_Info()
{
	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//							Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_HALLO		(C_INFO)
{
	npc			= BAU_952_Vino;
	nr 			= 1;
	condition	= DIA_Vino_HALLO_Condition;
	information	= DIA_Vino_HALLO_Info;
	permanent 	= FALSE;
	important	= TRUE;
	
};
func int DIA_Vino_HALLO_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Vino_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Vino_HALLO_15_00"); //¿Y qué tal va el trabajo?
	AI_Output (self, other, "DIA_Vino_HALLO_05_01"); //Como siempre. Hay mucho que hacer, nos falta dinero, y si tenemos mala suerte los orcos vendrán mañana y quemarán la granja.
	
	if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Vino_HALLO_05_02"); //Los paladines del rey han ocupado toda la ciudad, pero no creo que muevan el culo cuando los orcos nos ataquen.
		};
};

///////////////////////////////////////////////////////////////////////
//						Suche Arbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_SeekWork		(C_INFO)
{
	npc			= BAU_952_Vino;
	nr 			= 1;
	condition	= DIA_Vino_SeekWork_Condition;
	information	= DIA_Vino_SeekWork_Info;
	permanent 	= FALSE;
	description	= "¿Te puedo echar una mano? Busco trabajo.";
	
};
func int DIA_Vino_SeekWork_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Lobart_WorkNOW)
	||  Npc_KnowsInfo (other, DIA_Lobart_KLEIDUNG))
	&& (!Npc_IsDead (Lobart))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Vino_SeekWork_Info ()
{
	AI_Output (other, self, "DIA_Vino_SeekWork_15_00"); //¿Te puedo echar una mano? Busco trabajo.

	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Vino_SeekWork_05_01"); //¿Sabes trabajar en el campo?
		AI_Output (other, self, "DIA_Vino_SeekWork_15_02"); //¿Qué hay que saber?
		AI_Output (self, other, "DIA_Vino_SeekWork_05_03"); //¡Ah! En ese caso... No necesitamos ayuda, gracias.
		
		if (!Npc_IsDead(Lobart))
		{
			AI_Output (self, other, "DIA_Vino_SeekWork_05_04"); //Si quieres trabajar como peón para Lobart, te advierto que paga muy mal a los de tu ralea.
		
			if ( (Mob_HasItems("CHEST_LOBART", ITAR_Bau_L) == TRUE) || (Npc_HasItems (lobart, itar_bau_l) > 0) )
			&& (Lobart_Kleidung_Verkauft == FALSE)
			&& ( (Npc_KnowsInfo (other, DIA_Lobart_KLEIDUNG)) || (Npc_KnowsInfo (other, DIA_Lobart_WorkNOW)) )
			{
				AI_Output (other, self, "DIA_Vino_SeekWork_15_05"); //Se ofreció a venderme barata algo de ropa limpia si le ayudaba en la granja.
				AI_Output (self, other, "DIA_Vino_SeekWork_05_06"); //Um. Ahora mismo no tengo nada para ti, pero puedes traernos algo de beber a mí y a los muchachos.
				AI_Output (self, other, "DIA_Vino_SeekWork_05_07"); //Tráeme una botella de vino y le diré a Lobart que nos fuiste de gran ayuda. (Se ríe burlonamente)
				
				MIS_Vino_Wein = LOG_RUNNING;
				
				Log_CreateTopic (TOPIC_Vino,LOG_MISSION);
				Log_SetTopicStatus (TOPIC_Vino,LOG_RUNNING);
				B_LogEntry (TOPIC_Vino,"Si le llevo a Vino una botella de vino, le dirá a Lobart que le ayudé.");
				
			}
			else
			{	
				AI_Output (self, other, "DIA_Vino_SeekWork_05_08"); //Pero yo no te he dicho nada, ¿me oyes?
			};
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Vino_SeekWork_05_09"); //No creo. Alguien de tu posición no querría hacer el tipo de trabajos humildes que ofrezco.
	};
};

///////////////////////////////////////////////////////////////////////
//						Wein bringen
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_BringWine		(C_INFO)
{
	npc			= BAU_952_Vino;
	nr 			= 1;
	condition	= DIA_Vino_BringWine_Condition;
	information	= DIA_Vino_BringWine_Info;
	permanent 	= FALSE;
	description	= "Ten el vino.";
	
};
func int DIA_Vino_BringWine_Condition ()
{
	if (MIS_Vino_Wein == LOG_RUNNING)
	&& (Npc_HasItems (other, itfo_wine) > 0)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Vino_BringWine_Info ()
{
	AI_Output (other, self, "DIA_Vino_BringWine_15_00"); //Ten el vino.
	B_GiveInvItems (other,self, itfo_wine, 1);
	AI_Output (self, other, "DIA_Vino_BringWine_05_01"); //Será mejor que no pregunte de dónde lo has sacado, ¿eh? (Se ríe) ¿Qué más da?
	if (!Npc_IsDead (Lobart))
	{
		AI_Output (self, other, "DIA_Vino_BringWine_05_02"); //De todos modos, gracias.

		if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Vino_BringWine_05_03"); //Lobart recibirá las mejores referencias.
		};
	};
	
	MIS_Vino_Wein = LOG_SUCCESS;
	B_GivePlayerXP(XP_VinoWein);
	
	
};


///////////////////////////////////////////////////////////////////////
//						will in die Stadt 
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_ToTheCity (C_INFO)
{
	npc			= BAU_952_Vino;
	nr 			= 3;
	condition	= DIA_Vino_ToTheCity_Condition;
	information	= DIA_Vino_ToTheCity_Info;
	permanent 	= FALSE;
	description	= "Me voy a la ciudad.";
};

func int DIA_Vino_ToTheCity_Condition ()
{
	if (hero.guild == GIL_NONE)
		{
				return TRUE;
		};
};

func void DIA_Vino_ToTheCity_Info ()
{
	AI_Output (other, self, "DIA_Vino_ToTheCity_15_00"); //Me voy a la ciudad.
	AI_Output (self, other, "DIA_Vino_ToTheCity_05_01"); //¿Y?
	AI_Output (other, self, "DIA_Vino_ToTheCity_15_02"); //¿Me puedes contar algo interesante de la ciudad?
	AI_Output (self, other, "DIA_Vino_ToTheCity_05_03"); //No, pero Maleth va a la ciudad de vez en cuando. A lo mejor sabe algo... es decir, algo que te interese.
};


///////////////////////////////////////////////////////////////////////
//								Gerüchte (PERM)
///////////////////////////////////////////////////////////////////////

// --------------------------
	var int Vino_Gossip_Orks;
	var int Vino_Gossip_Bugs;
// --------------------------

instance DIA_Vino_PERM (C_INFO)
{
	npc			= BAU_952_Vino;
	nr 			= 10;
	condition	= DIA_Vino_PERM_Condition;
	information	= DIA_Vino_PERM_Info;
	permanent 	= TRUE;
	description	= "¿Hay alguna noticia interesante?";
};
func int DIA_Vino_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Vino_HALLO))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Vino_PERM_Info ()
{
	AI_Output (other, self, "DIA_Vino_PERM_15_00"); //¿Hay alguna noticia interesante?
	
	if (Vino_Gossip_Orks == FALSE)
	{
		AI_Output (self, other, "DIA_Vino_PERM_05_01"); //Juraría haber visto un orco en el lindero del bosque hace un par de días.
		AI_Output (self, other, "DIA_Vino_PERM_05_02"); //Desde entonces duermo con un ojo abierto.
		Vino_Gossip_Orks = TRUE;
		Knows_Ork = TRUE;
	}
	else if (Vino_Gossip_Bugs == FALSE)
	&& 		(MIS_AndreHelpLobart == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Vino_PERM_05_03"); //Esos enormes y asquerosos escarabajos se están convirtiendo en todo un fastidio. Están por todas partes, y si no tienes cuidado, se lo comen todo.
		AI_Output (self, other, "DIA_Vino_PERM_05_04"); //Hace unos días estaba tumbado en la hierba de lo más tranquilo, a punto de quedarme dormido, y uno de esos malditos bichos se puso a comerse mi zapato.
		AI_Output (self, other, "DIA_Vino_PERM_05_05"); //Tenías que haberme visto correr. Desde entonces, no he podido dormir bien.
		Vino_Gossip_Bugs = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Vino_PERM_05_06"); //¿Además de lo que ya te he contado? No.
	};
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Vino_KAP3_EXIT(C_INFO)
{
	npc			= BAU_952_Vino;
	nr			= 999;
	condition	= DIA_Vino_KAP3_EXIT_Condition;
	information	= DIA_Vino_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Vino_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Vino_KAP3_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info DMTAMSTART
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_DMTAMSTART		(C_INFO)
{
	npc		 = 	BAU_952_Vino;
	nr		 = 	31;
	condition	 = 	DIA_Vino_DMTAMSTART_Condition;
	information	 = 	DIA_Vino_DMTAMSTART_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Y a ti qué tal te va?";
};

func int DIA_Vino_DMTAMSTART_Condition ()
{
	if (Kapitel == 3)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
var int DIA_Vino_DMTAMSTART_OneTime;
func void DIA_Vino_DMTAMSTART_Info ()
{
	AI_Output			(other, self, "DIA_Vino_DMTAMSTART_15_00"); //¿Y a ti qué tal te va?
	
	if (FoundVinosKellerei == TRUE)
	&& (DIA_Vino_DMTAMSTART_OneTime == FALSE)
	&& (hero.guild != GIL_MIL)
	{
		AI_Output			(self, other, "DIA_Vino_DMTAMSTART_05_01"); //Fatal. La milicia encontró el alambique que tenía escondido.
		AI_Output			(self, other, "DIA_Vino_DMTAMSTART_05_02"); //Espero que no se enteren de que es mío.
		B_GivePlayerXP (XP_AmbientKap3);
		DIA_Vino_DMTAMSTART_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Vino_DMTAMSTART_05_03"); //Esos cerdos de las túnicas negras están por todas partes. Alguien debería hacer que se tragaran las capas.
	};
};


///////////////////////////////////////////////////////////////////////
//	Info Obesessed
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_Obesessed		(C_INFO)
{
	npc		 = 	BAU_952_Vino;
	nr		 = 	32;
	condition	 = 	DIA_Vino_Obesessed_Condition;
	information	 = 	DIA_Vino_Obesessed_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Qué es lo que no está bien?";
};

func int DIA_Vino_Obesessed_Condition ()
{
	if 	(NpcObsessedByDMT_Vino == FALSE)
	&& (Kapitel >= 3)
	&& (hero.guild == GIL_KDF)
	 {
				return TRUE;
	 };
};

func void DIA_Vino_Obesessed_Info ()
{
	if (Npc_IsDead(DMT_Vino1))
	&& (Npc_IsDead(DMT_Vino2))
	&& (Npc_IsDead(DMT_Vino3))
	&& (Npc_IsDead(DMT_Vino4))
	{
	B_NpcObsessedByDMT (self);
	}
	else
	{
	AI_Output			(other, self, "DIA_Vino_Obesessed_15_00"); //¿Qué pasa contigo?
	AI_Output			(self, other, "DIA_Vino_Obesessed_05_01"); //(Brama) Maldita sea, lárgate. Si no, me van a matar.
	AI_StopProcessInfos (self);
	DMT_Vino1.aivar[AIV_EnemyOverride] = FALSE;
	DMT_Vino2.aivar[AIV_EnemyOverride] = FALSE;
	DMT_Vino3.aivar[AIV_EnemyOverride] = FALSE;
	DMT_Vino4.aivar[AIV_EnemyOverride] = FALSE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_Heilung		(C_INFO)
{
	npc		 = 	BAU_952_Vino;
	nr		 = 	55;
	condition	 = 	DIA_Vino_Heilung_Condition;
	information	 = 	DIA_Vino_Heilung_Info;
	permanent	 = 	TRUE;

	description	 = 	"No te reconozco.";
};

func int DIA_Vino_Heilung_Condition ()
{
 	if (NpcObsessedByDMT_Vino == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF)
	&& ((Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07")<4000) == FALSE)
	 {
				return TRUE;
	 };
};
var int DIA_Vino_Heilung_oneTime;
func void DIA_Vino_Heilung_Info ()
{
	AI_Output			(other, self, "DIA_Vino_Heilung_15_00"); //No te reconozco.
	AI_Output			(self, other, "DIA_Vino_Heilung_05_01"); //Mi cabeza... No aguanto más.

	if (DIA_Vino_Heilung_oneTime == FALSE)
	{
		AI_Output			(other, self, "DIA_Vino_Heilung_15_02"); //Deberías ir al monasterio. A lo mejor Pyrokar, el mago de fuego de mayor rango, puede ayudarte.
		AI_Output			(self, other, "DIA_Vino_Heilung_05_03"); //¿Tú crees? Vale. Lo intentaré.
		B_NpcClearObsessionByDMT (self);
		B_StartOtherRoutine  (Vino,"Kloster"); 
		
		B_LogEntry (TOPIC_DEMENTOREN,"Vino está poseído. Le he mandado al monasterio a que le curen. Espero que llegue de una pieza."); 
	
		B_GivePlayerXP (XP_VinoFreeFromDMT);
		DIA_Vino_Heilung_oneTime = TRUE;
	};
};


//#####################################################################
//##
//##	
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Vino_KAP4_EXIT(C_INFO)
{
	npc			= BAU_952_Vino;
	nr			= 999;
	condition	= DIA_Vino_KAP4_EXIT_Condition;
	information	= DIA_Vino_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Vino_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Vino_KAP4_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};



///////////////////////////////////////////////////////////////////////
//	Info perm4Obsessed
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_PERM4OBSESSED		(C_INFO)
{
	npc		 = 	BAU_952_Vino;
	nr		 = 	41;
	condition	 = 	DIA_Vino_PERM4OBSESSED_Condition;
	information	 = 	DIA_Vino_PERM4OBSESSED_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Qué tal estás?";
};

func int DIA_Vino_PERM4OBSESSED_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (NpcObsessedByDMT_Vino == TRUE) 
	&& (Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07")<4000)
	{
		return TRUE;
	};
};

var int DIA_Vino_PERM4OBSESSED_XP_oneTime;

func void DIA_Vino_PERM4OBSESSED_Info ()
{
	AI_Output			(other, self, "DIA_Vino_PERM4OBSESSED_15_00"); //¿Qué tal estás?
	AI_Output			(self, other, "DIA_Vino_PERM4OBSESSED_05_01"); //Ya estoy bien. Creo que los chicos me pueden echar una mano, aunque sigo algo mareado.

	if (DIA_Vino_PERM4OBSESSED_XP_oneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Vino_PERM4OBSESSED_05_02"); //No obstante, he de decir que su vino es el mejor que he probado en mi vida.
	B_GivePlayerXP (XP_Ambient);
	DIA_Vino_PERM4OBSESSED_XP_oneTime = TRUE; 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Perm45und6
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_PERM45UND6		(C_INFO)
{
	npc		 = 	BAU_952_Vino;
	nr		 = 	42;
	condition	 = 	DIA_Vino_PERM45UND6_Condition;
	information	 = 	DIA_Vino_PERM45UND6_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Alguna novedad?";
};

func int DIA_Vino_PERM45UND6_Condition ()
{
	if (Kapitel >= 4)	
	&& (hero.guild != GIL_KDF)
	&& (NpcObsessedByDMT_Vino == FALSE) 
		{
			return TRUE;
		};
};

func void DIA_Vino_PERM45UND6_Info ()
{
	AI_Output			(other, self, "DIA_Vino_PERM45UND6_15_00"); //¿Alguna novedad?

	if (hero.guild == GIL_PAL)
	{
	AI_Output			(self, other, "DIA_Vino_PERM45UND6_05_01"); //El número de orcos en la región se ha disparado.
	AI_Output			(self, other, "DIA_Vino_PERM45UND6_05_02"); //Los paladines vais a acabar con ellos, ¿verdad?
	}
	else	//hero.guild == GIL_DJG
	{
	AI_Output			(self, other, "DIA_Vino_PERM45UND6_05_03"); //Me temo que no vamos a tardar en abandonar la granja y unirnos a los mercenarios en la granja de Onar.
	};
	
	if (FoundVinosKellerei == TRUE)
	&& (hero.guild != GIL_MIL)
	{
		AI_Output			(self, other, "DIA_Vino_PERM45UND6_05_04"); //Por desgracia, la milicia encontró mi alambique. Espero que no me pillen.
	};
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Vino_KAP5_EXIT(C_INFO)
{
	npc			= BAU_952_Vino;
	nr			= 999;
	condition	= DIA_Vino_KAP5_EXIT_Condition;
	information	= DIA_Vino_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Vino_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Vino_KAP5_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Vino_KAP6_EXIT(C_INFO)
{
	npc			= BAU_952_Vino;
	nr			= 999;
	condition	= DIA_Vino_KAP6_EXIT_Condition;
	information	= DIA_Vino_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Vino_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Vino_KAP6_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Vino_PICKPOCKET (C_INFO)
{
	npc			= BAU_952_Vino;
	nr			= 900;
	condition	= DIA_Vino_PICKPOCKET_Condition;
	information	= DIA_Vino_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Vino_PICKPOCKET_Condition()
{
	C_Beklauen (34, 60);
};
 
FUNC VOID DIA_Vino_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Vino_PICKPOCKET);
	Info_AddChoice		(DIA_Vino_PICKPOCKET, DIALOG_BACK 		,DIA_Vino_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Vino_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Vino_PICKPOCKET_DoIt);
};

func void DIA_Vino_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Vino_PICKPOCKET);
};
	
func void DIA_Vino_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Vino_PICKPOCKET);
};























































