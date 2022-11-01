// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_NOV_8_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_NOV_8_EXIT_Condition;
	information	= DIA_NOV_8_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_NOV_8_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 		Fegen
// *************************************************************************
INSTANCE DIA_NOV_8_Fegen(C_INFO)
{
	nr			= 2;
	condition	= DIA_NOV_8_Fegen_Condition;
	information	= DIA_NOV_8_Fegen_Info;
	permanent	= TRUE;
	description = "Mi serve una mano per ripulire le camere dei novizi.";
};                       

FUNC INT DIA_NOV_8_Fegen_Condition()
{
	if (Kapitel == 1)
	&& (MIS_KlosterArbeit == LOG_RUNNING)
	&& (NOV_Helfer < 4)
	{
		return TRUE;
	};
};
//-------------------------------
var int Feger3_Permanent;
//-------------------------------
FUNC VOID DIA_NOV_8_Fegen_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_Fegen_15_00"); //Mi serve una mano per ripulire le camere dei novizi.
	
	if (Hlp_GetInstanceID (Feger3) == Hlp_GetInstanceID (self))
	{	
		if (Feger3_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_01"); //Santo cielo. Sei appena giunto qui e lasci già che ti facciano spazzare per terra?
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_02"); //Consolati, a me è successa esattamente la stessa cosa la prima volta che sono arrivato. Ed è per questo che ti aiuterò. Sarebbe ridicolo se non ci dessimo una mano a vicenda.
			
			NOV_Helfer = (NOV_Helfer +1);
			Feger3_Permanent = TRUE;
			B_GivePlayerXP (XP_Feger);
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self,"FEGEN");
			
			B_LogEntry 	(Topic_ParlanFegen,"Ho trovato un novizio disposto ad aiutarmi a spazzare le stanze.");
		}
		else //if (Feger3_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_03"); //Conosco la situazione in cui ti trovi. Ti ho già detto che ti aiuterò, ed è ciò che sto facendo.
		};
	};
	//-------------------------- alle anderen Novizen mit Stimme 8 -----------------------------------------------------
	
	if ((Hlp_GetInstanceID (Feger3) == Hlp_GetInstanceID (self)) == FALSE )
	{	
		AI_Output (self, other, "DIA_NOV_8_Fegen_08_04"); //Ehi, ti aiuterei volentieri, ma sono molto occupato.
	};
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_NOV_8_Wurst(C_INFO)
{
	nr			= 3;
	condition	= DIA_NOV_8_Wurst_Condition;
	information	= DIA_NOV_8_Wurst_Info;
	permanent	= TRUE;
	description = "Che ne dici di una salsiccia di pecora?";
};                       

FUNC INT DIA_NOV_8_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_8_Wurst_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_Wurst_15_00"); //Che ne dici di una salsiccia di pecora?
	AI_Output (self, other, "DIA_NOV_8_Wurst_08_01"); //Come posso rifiutare? Grazie amico, era proprio quello che mi ci voleva.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_NOV_8_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_NOV_8_JOIN_Condition;
	information	= DIA_NOV_8_JOIN_Info;
	permanent	= TRUE;
	description = "Che cosa devo fare per diventare un mago?";
};                       

FUNC INT DIA_NOV_8_JOIN_Condition()
{
	if (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_8_JOIN_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_JOIN_15_00"); //Che cosa devo fare per diventare un mago?
	AI_Output (self, other, "DIA_NOV_8_JOIN_08_01"); //Diventerai un prescelto di Innos solo quando lo diranno gli Alti Maghi del Fuoco.
	AI_Output (self, other, "DIA_NOV_8_JOIN_08_02"); //Come novizi ci è proibito studiare le rune magiche, e possiamo leggere i vecchi testi sacri solo su permesso dei maghi.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_NOV_8_PEOPLE(C_INFO)
{
	nr			= 5;
	condition	= DIA_NOV_8_PEOPLE_Condition;
	information	= DIA_NOV_8_PEOPLE_Info;
	permanent	= TRUE;
	description = "Chi è il capo di questo monastero?";
};                       

FUNC INT DIA_NOV_8_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_PEOPLE_15_00"); //Chi è il capo di questo monastero?
	AI_Output (self, other, "DIA_NOV_8_PEOPLE_08_01"); //L'Alto Concilio. È composto dai tre maghi più potenti del nostro ordine. Essi si consultano quotidianamente nella chiesa.
	AI_Output (self, other, "DIA_NOV_8_PEOPLE_08_02"); //Gli Eletti di Innos sono tutti maghi. Innos ha dato loro questo dono, in modo che essi siano in grado di fare la sua volontà in terra.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_NOV_8_LOCATION(C_INFO)
{
	nr			= 6;
	condition	= DIA_NOV_8_LOCATION_Condition;
	information	= DIA_NOV_8_LOCATION_Info;
	permanent	= TRUE;
	description = "Parlami di questo monastero.";
};                       

FUNC INT DIA_NOV_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_LOCATION_15_00"); //Parlami di questo monastero.
	AI_Output (self, other, "DIA_NOV_8_LOCATION_08_01"); //È una struttura antica, costruita ben prima dell'era di Rhobar I.
	AI_Output (self, other, "DIA_NOV_8_LOCATION_08_02"); //Sotto al monastero ci sono le catacombe. Esse si estendono fin nelle profondità della montagna.
	//AI_Output (self, other, "DIA_NOV_8_LOCATION_08_03"); //Aber zur untersten Ebene haben nur die höchsten Geweihten Innos' Zutritt.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_NOV_8_STANDARD(C_INFO)
{
	nr			= 10;
	condition	= DIA_NOV_8_STANDARD_Condition;
	information	= DIA_NOV_8_STANDARD_Info;
	permanent	= TRUE;
	description = "Ci sono novità?";
};
                       
func INT DIA_NOV_8_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_STANDARD_15_00"); //Ci sono novità?
		
	if (Kapitel == 1)
	{
		if (other.guild == GIL_KDF)
		{
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_01"); //Puoi dirlo forte. Sono passati oltre cento anni dall'ultima volta che un novizio è stato ammesso così rapidamente nel Circolo del Fuoco.
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_02"); //Spero di avere anch'io quest'onore un giorno. Lavorerò sodo per questo.
		}
		else
		{
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_03"); //I paladini sono arrivati da poco a Khorinis. Uno di essi sta pregando nel monastero.
		};
	};

	if (Kapitel == 2)
	|| (Kapitel == 3)
	{
		if (Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)	//Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
	 		AI_Output (self,other,"DIA_NOV_3_STANDARD_08_04"); //Non riesco ancora a crederci. Uno di noi ha tradito il monastero e ha rubato l'Occhio di Innos.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_05"); //Il nostro compito era costruire una comunità, ma eravamo troppo deboli. Questa è l'unica ragione per cui Beliar è riuscito ad attirare uno dei nostri dalla sua parte.
		}
		else if (MIS_NovizenChase == LOG_SUCCESS)	//Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_06"); //Siamo riusciti a recuperare l'Occhio dal nemico. Sia lodato Innos.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_07"); //Il tuo coraggio può essere d'esempio per molte anime perse per aiutarle a sopravvivere in questi tempi bui.
		}
		else //Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self,other,"DIA_NOV_8_STANDARD_08_08"); //Ho sentito parlare di draghi e di un esercito del male. Che Innos ci protegga!
			}
			else
			{
				AI_Output (self,other,"DIA_NOV_8_STANDARD_08_09"); //L'Alto Concilio è molto preoccupato per la situazione in cui si trovano i nostri paladini. Ormai è un po' che non si hanno più notizie dalla Valle delle Miniere.
			};
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_10"); //No. E ringrazio il nostro Signore per questo. Con l'Occhio di Innos saremo in grado di sconfiggere i draghi!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_11"); //Sì. Abbiamo sconfitto i draghi! Innos ci ha dimostrato che non bisogna mai perdere la speranza.
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_12"); //Ci sono già molte ombre e noi dobbiamo accendere molti fuochi per scacciarle.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_NOV_8 (var c_NPC slf)
{
	DIA_NOV_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_STANDARD.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_Fegen.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_Wurst.npc					= Hlp_GetInstanceID(slf);
};
