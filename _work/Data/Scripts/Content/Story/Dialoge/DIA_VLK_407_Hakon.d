///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hakon_EXIT   (C_INFO)
{
	npc         = VLK_407_Hakon;
	nr          = 999;
	condition   = DIA_Hakon_EXIT_Condition;
	information = DIA_Hakon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Hakon_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Hakon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Sperre
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Sperre		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	2;
	condition	 = 	DIA_Hakon_Sperre_Condition;
	information	 = 	DIA_Hakon_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Hakon_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self, ZS_Talk ))
	{
		return TRUE;
	};
	//return FALSE;
};
func void DIA_Hakon_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Hakon_Sperre_12_00"); //¡Lárgate, convicto! ¡Canthar me dijo la clase de bastardo que eras!
	AI_StopProcessInfos (self);	 
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Hallo		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 =  3;
	condition	 = 	DIA_Hakon_Hallo_Condition;
	information	 = 	DIA_Hakon_Hallo_Info;
	important	 = 	TRUE;
	permanent	 =  FALSE;
};
func int DIA_Hakon_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk) 
	&& (Canthar_Sperre == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Hallo_Info ()
{
	AI_Output (self ,other,"DIA_Hakon_Add_12_00"); //Soy Hakon, el tratante de armas.
	AI_Output (self ,other,"DIA_Hakon_Add_12_01"); //Todos los hombres deberían llevar un arma hoy en día. Especialmente al aventurarse fuera de la muralla de la ciudad.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Hakon vende armas en el mercado.");
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Trade		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	99;
	condition	 = 	DIA_Hakon_Trade_Condition;
	information	 = 	DIA_Hakon_Trade_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Enséñame tu mercancía.";
};
func int DIA_Hakon_Trade_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Hakon_Trade_15_00"); //Enséñame tu mercancía.
	
	if (hero.guild == GIL_PAL)
	|| (hero.guild == GIL_KDF)
	{
		AI_Output (self,other,"DIA_Hakon_Trade_12_01"); //Es un honor para mí que un representante de nuestra sagrada iglesia muestre interés en mi mercancía.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Hakon_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_407_Hakon;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Hakon_MissingPeople_Condition;
	information	 = 	DIA_Addon_Hakon_MissingPeople_Info;

	description	 = 	"¿Qué sabes sobre la desaparición de ciudadanos de Khorinis?";
};

func int DIA_Addon_Hakon_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Hakon_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Hakon_MissingPeople_15_00"); //¿Qué sabes sobre la desaparición de ciudadanos de Khorinis?
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_01"); //He visto pasar a muchos por la puerta este de la ciudad.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_02"); //Algunos de los que han pasado no los había visto en mi vida y muchos de los que han salido no han vuelto nunca.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_03"); //Pero lo que pasó el otro día fue muy raro.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_04"); //Apareció por aquí un tipo, creo que se llamaba Joe. Presumía de que pronto ganaría mucho dinero.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_05"); //Decía que sabía cómo entrar en una de las torres de la ciudad donde la milicia guarda armamento.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_06"); //Desde entonces, no lo he visto, a pesar de que antes me lo encontraba a diario sobre la misma hora.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_07"); //He informado de esto a la milicia. Pensé que quizás le hubieran atrapado y arrojado al calabozo.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_08"); //Sin embargo, Lord Andre no tenía ni idea de qué le hablaba. Ni siquiera conocía al tipo.

	Log_CreateTopic (TOPIC_Addon_Joe, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Joe, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Joe,"Halon, un comerciante de Khorinis, dice que un hombre llamado Joe se ha esfumado sin dejar rastro. Dice que Joe sabe entrar en una de las torres de la ciudad, donde la milicia guarda armas."); 

	B_GivePlayerXP (XP_Ambient);
};

// ********************************************************
// 						OutOfTown
// ********************************************************
instance DIA_Hakon_OutOfTown		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	2;
	condition	 = 	DIA_Hakon_OutOfTown_Condition;
	information	 = 	DIA_Hakon_OutOfTown_Info;
	permanent	 = 	FALSE;
	description	 = 	"Cuéntame más sobre el área que rodea a la ciudad.";
};
func int DIA_Hakon_OutOfTown_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_OutOfTown_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_02"); //Cuéntame más sobre el área que rodea a la ciudad.
	AI_Output (self ,other,"DIA_Hakon_Add_12_03"); //Se ha transformado en un lugar muy peligroso.
	AI_Output (self ,other,"DIA_Hakon_Add_12_04"); //A causa de los bandidos, por una parte, y también por las bestias salvajes.
	AI_Output (self ,other,"DIA_Hakon_Add_12_05"); //Ni siquiera los animales parecen tener suficiente para comer en estos momentos de escasez.
	AI_Output (self ,other,"DIA_Hakon_Add_12_06"); //Cada vez se aventuran más cerca de la ciudad.
};

// ********************************************************
// 						Paladine
// ********************************************************
instance DIA_Hakon_Paladine		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	3;
	condition	 = 	DIA_Hakon_Paladine_Condition;
	information	 = 	DIA_Hakon_Paladine_Info;
	permanent	 = 	FALSE;
	description	 = 	"¿Sabes algo de los paladines?";
};
func int DIA_Hakon_Paladine_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_Paladine_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_07"); //¿Sabes algo de los paladines?
	AI_Output (self ,other,"DIA_Hakon_Add_12_08"); //¡Sí! ¡Esos tipos están arruinando mi negocio!
	AI_Output (self ,other,"DIA_Hakon_Add_12_09"); //Lo único que puedes comprar en toda la ciudad es una espada corta, como mucho.
	AI_Output (self ,other,"DIA_Hakon_Add_12_10"); //Se han hecho con todo lo que mide más de medio metro.
	AI_Output (self ,other,"DIA_Hakon_Add_12_11"); //(Sarcástico) A cambio, ahora puedo vivir en el hotel gratis. ¡Ja!
};

// ********************************************************
// 						WoWaffen
// ********************************************************
instance DIA_Hakon_WoWaffen		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	4;
	condition	 = 	DIA_Hakon_WoWaffen_Condition;
	information	 = 	DIA_Hakon_WoWaffen_Info;
	permanent	 = 	FALSE;
	description	 = 	"¿De dónde obtienes tus armas?";
};
func int DIA_Hakon_WoWaffen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Hakon_Paladine))
	{
		return TRUE;
	};
};
func void DIA_Hakon_WoWaffen_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_12"); //¿De dónde obtienes tus armas?
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_13"); //¡De ningún sitio! Harad ha sido mi proveedor hasta la fecha.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_14"); //Harad el herrero ha sido mi proveedor hasta la fecha.
	};
	AI_Output (self ,other,"DIA_Hakon_Add_12_15"); //Ahora lo único que hace es material para los paladines.
	AI_Output (self ,other,"DIA_Hakon_Add_12_16"); //Trabaja para esos tipos día y noche como un lunático, sin cobrar. Cree que es su deber.
	AI_Output (self ,other,"DIA_Hakon_Add_12_17"); //Lo único que puedo ofrecerte ahora es el resto de mis existencias...
};

// ********************************************************
// 						HaradBandits
// ********************************************************
instance DIA_Hakon_HaradBandits		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	5;
	condition	 = 	DIA_Hakon_HaradBandits_Condition;
	information	 = 	DIA_Hakon_HaradBandits_Info;
	permanent	 = 	FALSE;
	description	 = 	"Harad me contó lo del ataque de los bandidos...";
};
func int DIA_Hakon_HaradBandits_Condition ()
{
	if (Harad_HakonMission == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Hakon_HaradBandits_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_18"); //Harad me contó lo del ataque de los bandidos...
	AI_Output (self ,other,"DIA_Hakon_Add_12_19"); //¡Oh!, ¿y?
	AI_Output (other, self,"DIA_Hakon_Add_15_20"); //Me dará su aprobación para ser aceptado como aprendiz si doy caza a los bandidos.
	AI_Output (self ,other,"DIA_Hakon_Add_12_21"); //(Se ríe) El buenazo de Harad. Debe ser su forma de decir que siente no poder fabricarme armas en este momento.
};

///////////////////////////////////////////////////////////////////////
//	Info Banditen
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Banditen		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	6;
	condition	 = 	DIA_Hakon_Banditen_Condition;
	information	 = 	DIA_Hakon_Banditen_Info;
	permanent	 = 	FALSE;
	description	 = 	"¿Qué sabes de los bandidos?";
};
func int DIA_Hakon_Banditen_Condition ()
{
	if (Npc_KnowsInfo (hero, DIA_Hakon_HaradBandits))
	|| (Npc_KnowsInfo (hero, DIA_Hakon_OutOfTown))
	{
		return TRUE;
	};
};
func void DIA_Hakon_Banditen_Info ()
{
	AI_Output (other, self, "DIA_Hakon_Banditen_15_00"); //¿Qué sabes de los bandidos?
	AI_Output (self, other, "DIA_Hakon_Banditen_12_01"); //¿Que qué sé sobre ellos? ¡Me robaron de camino a la ciudad!
	AI_Output (self, other, "DIA_Hakon_Banditen_12_02"); //Y no soy el único. Llevan haciendo de las suyas una buena temporada.
	AI_Output (self, other, "DIA_Hakon_Banditen_12_03"); //La milicia intentó darles caza, pero sin éxito.

	MIS_HakonBandits = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_HakonBanditen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HakonBanditen,LOG_RUNNING);
	B_LogEntry(TOPIC_HakonBanditen,"Hakon, el mercader de armas, ha sido robado por bandidos de fuera de la ciudad." );
};


///////////////////////////////////////////////////////////////////////
//	WIEVIEL
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Wieviel		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	6;
	condition	 = 	DIA_Hakon_Wieviel_Condition;
	information	 = 	DIA_Hakon_Wieviel_Info;
	permanent	 = 	FALSE;
	description	 = 	"Me ocuparé de ello...";
};
func int DIA_Hakon_Wieviel_Condition ()
{
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Wieviel_Info ()
{
	AI_Output (other, self, "DIA_Hakon_Banditen_Ehre_15_00"); //Me ocuparé de ello...
	AI_Output (self, other, "DIA_Hakon_Banditen_Kohle_12_01"); //¿Qué?, ¿que TÚ quieres ocuparte de los bandidos? ¿Tú solo? Eres un buen guerrero, ¿eh?
	AI_Output (other, self, "DIA_Hakon_Banditen_Kohle_15_00"); //¿Cuánto vale este asunto para ti?
	
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_25"); //(Con astucia) Quieres estar en los libros buenos de Harad, ¿no?
		AI_Output (self ,other,"DIA_Hakon_Add_12_26"); //No creo que deba pagarte por esto...
	}
	else
	{
		AI_Output (self, other, "DIA_Hakon_Banditen_Ehre_12_01"); //Es un asunto peligroso.
		AI_Output (self, other, "DIA_Hakon_Banditen_Kohle_12_02"); //Vale, por mí, de acuerdo. Te pagaré 100 monedas de oro si derrotas a los bandidos.
		MIS_HakonBanditsPay = TRUE;
	};
	
	Info_ClearChoices (DIA_Hakon_Banditen);
};

///////////////////////////////////////////////////////////////////////
//	Info Miliz
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Miliz		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	4;
	condition	 = 	DIA_Hakon_Miliz_Condition;
	information	 = 	DIA_Hakon_Miliz_Info;
	permanent	 = 	FALSE;
	description	 = 	"¿Quiénes de la milicia tomaron parte en la búsqueda?";
};

func int DIA_Hakon_Miliz_Condition ()
{	
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Miliz_Info ()
{
	
	AI_Output (other, self, "DIA_Hakon_Miliz_15_00"); //¿Sabes de algún miliciano que participara en la búsqueda?
	AI_Output (self, other, "DIA_Hakon_Miliz_12_01"); //Un tal Pablo. Él y unos cuantos más salieron en busca de los bandidos. Pero no los encontraron.
	AI_Output (other, self, "DIA_Hakon_Miliz_15_02"); //¿Sabes dónde puedo encontrar a Pablo?
	AI_Output (self, other, "DIA_Hakon_Miliz_12_03"); //Patrulla por la ciudad. Le encontrarás en la plaza del templo o en la parte baja de la ciudad.
	
	B_LogEntry(TOPIC_HakonBanditen,"Pablo, el guardia de la ciudad, participó en la infructuosa búsqueda de los bandidos." );
};
///////////////////////////////////////////////////////////////////////
//	Info Wo
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Wo		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	5;
	condition	 = 	DIA_Hakon_Wo_Condition;
	information	 = 	DIA_Hakon_Wo_Info;
	permanent	 = 	FALSE;
	description	 = 	"¿Dónde te asaltaron?";
};

func int DIA_Hakon_Wo_Condition ()
{	
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Wo_Info ()
{
	AI_Output (other, self, "DIA_Hakon_Wo_15_00"); //¿Dónde te asaltaron?
	AI_Output (self, other, "DIA_Hakon_Wo_12_01"); //Cerca de la granja de Akil. Sal desde aquí por la puerta de la ciudad y sigue el camino a la derecha.
	AI_Output (self, other, "DIA_Hakon_Wo_12_02"); //Después de un rato, llegarás a unos escalones. Los muy bastardos salieron de ahí. Apuesto a que tienen su guarida en los bosques.
};
///////////////////////////////////////////////////////////////////////
//	Info Miliz
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Success		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	2;
	condition	 = 	DIA_Hakon_Success_Condition;
	information	 = 	DIA_Hakon_Success_Info;
	permanent	 = 	FALSE;
	description	 = 	"Me ocupé de los bandidos.";
};

func int DIA_Hakon_Success_Condition ()
{	
	if (MIS_HakonBandits == LOG_RUNNING)
	&& (Npc_IsDead (Bandit_1))
	&& (Npc_IsDead (Bandit_2))
	&& (Npc_IsDead (Bandit_3))
	
	{
		return TRUE;
	};
};
func void DIA_Hakon_Success_Info ()
{
	
	AI_Output (other, self, "DIA_Hakon_Success_15_00"); //Me ocupé de los bandidos.
	AI_Output (self ,other,"DIA_Hakon_Add_12_27"); //¿De verdad? Cualquiera podría decir eso. ¿Tienes pruebas?
	AI_Output (other, self,"DIA_Hakon_Add_15_28"); //(Suspiro) ¿Debo volver a cortarles la cabeza?
	AI_Output (self ,other,"DIA_Hakon_Add_12_29"); //(Con rapidez) No, no creo que sea necesario. Te creo.
	AI_Output (self, other, "DIA_Hakon_Success_12_01"); //Has hecho un gran servicio a la ciudad y a los comerciantes.
	
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_30"); //Harad estará contento, creo.
	};
		
	if (MIS_HakonBanditsPay == TRUE)
	{	
		AI_Output (self, other, "DIA_Hakon_Success_12_02"); //Aquí tienes el dinero que se te prometió.
		B_GiveInvItems (self, other, ItMi_Gold,100);
	};
	MIS_HakonBandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_Hakon_Bandits); 
	
};

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Hakon_Minenanteil (C_INFO)
{
	npc			= VLK_407_Hakon;
	nr			= 3;
	condition	= DIA_Hakon_Minenanteil_Condition;
	information	= DIA_Hakon_Minenanteil_Info;
	permanent	= FALSE;
	description = "¿De dónde sacaste esas participaciones de la mina?";
};   
                    
FUNC INT DIA_Hakon_Minenanteil_Condition()
{	
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Hakon_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Hakon_Minenanteil_15_00"); //¿De dónde sacaste esas participaciones de la mina que estás vendiendo?
	AI_Output (self, other, "DIA_Hakon_Minenanteil_12_01"); //Lo siento, pero no puedo decírtelo. Es demasiado peligroso para mí.
	B_GivePlayerXP (XP_Ambient);
};	


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hakon_PICKPOCKET (C_INFO)
{
	npc			= VLK_407_Hakon;
	nr			= 900;
	condition	= DIA_Hakon_PICKPOCKET_Condition;
	information	= DIA_Hakon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Hakon_PICKPOCKET_Condition()
{
	C_Beklauen (45, 65);
};
 
FUNC VOID DIA_Hakon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hakon_PICKPOCKET);
	Info_AddChoice		(DIA_Hakon_PICKPOCKET, DIALOG_BACK 		,DIA_Hakon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hakon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hakon_PICKPOCKET_DoIt);
};

func void DIA_Hakon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hakon_PICKPOCKET);
};
	
func void DIA_Hakon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hakon_PICKPOCKET);
};


// ************************************************************
// 			  				Kapitel2
// ************************************************************

INSTANCE DIA_Hakon_Kapitel2 (C_INFO)
{
	npc			= VLK_407_Hakon;
	nr			= 5;
	condition	= DIA_Hakon_Kapitel2_Condition;
	information	= DIA_Hakon_Kapitel2_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Hakon_Kapitel2_Condition()
{
	if (Kapitel >= 2)
	&& (Canthar_Sperre == FALSE)
	&& (self.aivar[AIV_TalkedToPlayer] == TRUE) 
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hakon_Kapitel2_Info()
{	
	AI_Output (self ,other,"DIA_Hakon_Add_12_22"); //¡Ya estás otra vez!
	AI_Output (self ,other,"DIA_Hakon_Add_12_23"); //Harad ha terminado por fin ese maldito encargo de los paladines.
	AI_Output (self ,other,"DIA_Hakon_Add_12_24"); //Eso significa que ahora puedo ofrecerte algunas armas nuevas. ¿Te interesan?
};
